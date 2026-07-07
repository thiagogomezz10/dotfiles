menu() {
  local prompt="$1"
  local options="$2"
  local extra="$3"
  local preselect="$4"

  read -r -a args <<<"$extra"

  if [[ -n $preselect ]]; then
    local index
    index=$(echo -e "$options" | grep -nxF "$preselect" | cut -d: -f1)
    if [[ -n $index ]]; then
      args+=("-c" "$index")
    fi
  fi

  echo -e "$options" | walker --dmenu --width 295 --minheight 1 --maxheight 630 -p "$prompt…" "${args[@]}" 2>/dev/null
}

show_system_menu() {
  options="󰍃  Logout\n󰜉  Restart\n󰐥  Shutdown"

  case $(menu "System" "$options") in
  *Logout*) power "logout" ;;
  *Restart*) power "reboot" ;;
  *Shutdown*) power "shutdown" ;;
  esac
}

show_system_menu
