#!/usr/bin/env bash

pkg_manager="arch"
install_deps=true

usage() {
  echo "Usage: $0 [-b] [-p arch|brew]" >&2
}

while getopts ":bp:" opt; do
  case "$opt" in
  b)
    install_deps=false
    ;;
  p)
    case "$OPTARG" in
    arch | brew)
      pkg_manager="$OPTARG"
      ;;
    *)
      echo "Error: -p must be 'arch' or 'brew'" >&2
      usage
      exit 1
      ;;
    esac
    ;;
  :)
    echo "Error: -$OPTARG requires an argument" >&2
    usage
    exit 1
    ;;
  \?)
    echo "Error: Unknown flag -$OPTARG" >&2
    usage
    exit 1
    ;;
  esac
done
shift "$((OPTIND - 1))"

if [[ $# -ne 0 ]]; then
  echo "Error: Unexpected argument: $1" >&2
  usage
  exit 1
fi

if [[ "$install_deps" == false ]]; then
  echo "Skipping dependency installation."
  exit 0
fi

# Determine the package manager command
if [[ "$pkg_manager" == "arch" ]]; then
  pkg_manager_cmd=(sudo pacman -S --noconfirm)
else
  pkg_manager_cmd=(brew install)
fi

# Path to the package list file
pkgs_file="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/packages/cli-pkgs"

# Check if the package list file exists
if [[ ! -f "$pkgs_file" ]]; then
  echo "Error: Package list file not found at $pkgs_file" >&2
  exit 1
fi

mapfile -t packages < <(grep -v '^#' "$pkgs_file" | grep -v '^$')
"${pkg_manager_cmd[@]}" "${packages[@]}"

echo "Installation process completed."
