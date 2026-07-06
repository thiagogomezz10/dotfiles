#!/usr/bin/env bash
# summary=Cycle to the next active audio sink via WirePlumber (wrap-around)
# args=No arguments
set -euo pipefail

err() { printf 'toggle-audio-source: %s\n' "$*" >&2; }

if ! command -v wpctl >/dev/null 2>&1; then
  err "wpctl not found (is WirePlumber installed?)"
  exit 1
fi

mapfile -t raw < <(wpctl list audio sinks 2>/dev/null || true)
ids=()
current=-1
for line in "${raw[@]}"; do
  [[ "$line" == *audio/sink* ]] || continue
  id="${line%%	*}"
  id="${id// /}"
  [[ -n "$id" ]] || continue
  ids+=("$id")
  [[ "$line" == *"*"* ]] && current=$((${#ids[@]} - 1))
done

if ((${#ids[@]} == 0)); then
  msg="No audio sinks found"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send -t 2000 -u low "Audio output" "$msg"
  else
    err "$msg"
  fi
  exit 0
fi

status_out="$(wpctl status 2>/dev/null || true)"
friendly_lookup() {
  local id="$1"
  printf '%s\n' "$status_out" |
    sed -n '/Sinks:/,/Sources:/p' |
    grep -E "[[:space:]]+${id}\.[[:space:]]" |
    head -n1 |
    sed -E 's/^[[:space:]]+[0-9]+\.[[:space:]]+//; s/[[:space:]]+\[vol:.*$//'
}

pick_icon() {
  local name="$1"
  case "$name" in
  *Headphone* | *Headset* | *PELTA*) echo "audio-headphones" ;;
  *Speaker* | *Analog*) echo "audio-speakers" ;;
  *HDMI* | *DisplayPort* | *DP*) echo "video-display" ;;
  *) echo "audio-card" ;;
  esac
}

notify_user() {
  local title="$1" body="$2" icon="$3"
  if command -v swayosd-client >/dev/null 2>&1 &&
    swayosd-client --custom-message "$body" --custom-icon "$icon" 2>/dev/null; then
    return 0
  fi
  if command -v notify-send >/dev/null 2>&1; then
    notify-send -t 2000 -u low -i "$icon" "$title" "$body"
    return 0
  fi
  printf '%s: %s\n' "$title" "$body" >&2
  return 1
}

if ((${#ids[@]} == 1)); then
  only_name="$(friendly_lookup "${ids[0]}")"
  only_name="${only_name:-${ids[0]}}"
  only_display="$only_name"
  case "$only_name" in
  *"ROG PELTA"*) only_display="ROG PELTA 2.4GHz" ;;
  *"Ryzen HD Audio"*) only_display="Speakers" ;;
  esac
  notify_user "Audio output" "Already on: $only_display" "$(pick_icon "$only_name")" || true
  exit 0
fi

if ((current < 0)); then
  current=0
fi
next=$(((current + 1) % ${#ids[@]}))
target_id="${ids[$next]}"

if ! wpctl set-default "$target_id" >/dev/null 2>&1; then
  msg="Failed to set default sink to $target_id"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send -t 3000 -u critical "Audio output" "$msg"
  else
    err "$msg"
  fi
  exit 1
fi

canonical_name="$(friendly_lookup "$target_id")"
canonical_name="${canonical_name:-$target_id}"
display_name="$canonical_name"
case "$canonical_name" in
*"ROG PELTA"*) display_name="ROG PELTA 2.4GHz" ;;
*"Ryzen HD Audio"*) display_name="Speakers" ;;
esac
icon="$(pick_icon "$canonical_name")"
notify_user "Audio output" "$display_name" "$icon" || true
