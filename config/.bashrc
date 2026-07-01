#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Modular configuration
BASH_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"
if [[ -d "$BASH_CONFIG_DIR" ]]; then
    for _f in "$BASH_CONFIG_DIR"/*.sh; do
        [[ -r "$_f" ]] && source "$_f"
    done
    unset _f
fi
