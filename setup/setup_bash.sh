set -euo pipefail

setup_bash() {
	local script_dir config_dir
	script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	config_dir="${script_dir}/../config"

	mkdir -p "${HOME}/.config"

	cp "${config_dir}/bashrc" "${HOME}/.bashrc"
	echo "Copied ${config_dir}/bashrc -> ${HOME}/.bashrc"

	cp -r "${config_dir}/bash" "${HOME}/.config/bash"
	echo "Copied ${config_dir}/bash -> ${HOME}/.config/bash"
}
