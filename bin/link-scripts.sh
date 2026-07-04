#!/usr/bin/env bash
set -euo pipefail

# ── Colours ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

info() { echo -e "${BLUE}${BOLD}  →${RESET}  $*"; }
success() { echo -e "${GREEN}${BOLD}  ✓${RESET}  $*"; }
warn() { echo -e "${YELLOW}${BOLD}  !${RESET}  $*"; }
error() { echo -e "${RED}${BOLD}  ✗${RESET}  $*" >&2; }
header() { echo -e "\n${BOLD}$*${RESET}"; }

# ── Validate argument ─────────────────────────────────────────────────────────
if [[ -z "${1:-}" ]]; then
  error "No source directory specified."
  echo -e "  Usage: $(basename "$0") /path/to/scripts" >&2
  exit 1
fi

SOURCE_DIR="$(realpath "$1")"
DEST_DIR="${HOME}/.local/bin"

if [[ ! -d "$SOURCE_DIR" ]]; then
  error "Source directory not found: ${SOURCE_DIR}"
  exit 1
fi

# ── Link scripts ──────────────────────────────────────────────────────────────
header "Linking scripts → ${DEST_DIR}"
mkdir -p "$DEST_DIR"

shopt -s nullglob
files=("${SOURCE_DIR}"/*.sh)
shopt -u nullglob

if [[ ${#files[@]} -eq 0 ]]; then
  warn "No .sh files found in ${SOURCE_DIR}"
  exit 0
fi

for file in "${files[@]}"; do
  name="$(basename "$file" .sh)"
  ln -sf "$file" "${DEST_DIR}/${name}"
  success "Linked: ${name} → $(basename "$file")"
done

echo ""
success "All scripts linked to ${DEST_DIR}"
echo ""
