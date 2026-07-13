# Changelog

All notable changes to this repository are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added

- Added a general config installer with optional CLI dependency installation.
- Added backup-aware config copying for the managed config directory and Bash rc file.
- Added a CLI package list for shell tooling dependencies.
- Added Hyprland `conf.d` override templates for monitors, environment variables, input, look and feel, autostart, keybindings, and windows.
- Added a wallpaper helper that points the active Horizon wallpaper symlink at a selected image.
- Added shell aliases for tree listings, directory creation, file creation, Glow preview mode, and recently installed package inspection.
- Added an `mdg` shell helper for creating and entering a directory.
- Added Discord launch binding and window/workspace rules for Discord, virtual machines, Heroic, winboat, and xfreerdp.

### Changed

- Replaced the old Bash-only setup script with the broader config setup flow.
- Enabled vi keys in tmux copy mode.
- Tuned Hyprland gaps and active border color.
- Updated Waybar workspace icons for VM, Windows, games, and Discord workspaces.
- Removed stale commented terminal scroll configuration from the Hyprland input module.
- Added the initial repository changelog.

## [v0.1.0] - 2026-07-07

Initial dotfiles baseline, covering shell setup, terminal/editor defaults, Hyprland, Waybar, SwayOSD, Walker, and helper scripts.

### Added

- Added the initial Bash configuration layout with aliases, environment variables, readline/input settings, shell initialization, and a bootstrap script for installing the Bash config.
- Added baseline Neovim and tmux configuration.
- Added Starship prompt configuration.
- Added a Hyprland Lua configuration with a modular `horizon/hypr` structure for paths, helpers, input, look and feel, animations, autostart, keybindings, and window rules.
- Added Hyprpaper defaults.
- Added application, media, and tiling keybinding modules for Hyprland.
- Added workspace navigation, window focus/move/resize controls, scratchpad bindings, fullscreen/floating/pseudo/togglesplit controls, and dedicated workspace shortcuts for games and Windows-related apps.
- Added app launch bindings for terminal, tmux terminal sessions, file manager, browser, Spotify, Discord, and Wiremix.
- Added media controls using SwayOSD and playerctl integrations, including volume, playback, screenshots, and audio sink toggling.
- Added Waybar configuration and styling with Hyprland workspaces, clocks, tray expansion, Bluetooth, network, audio, CPU, battery, weather/update/indicator modules, and custom workspace icons.
- Added SwayOSD configuration and styling.
- Added UWSM environment defaults.
- Added Walker configuration, desktop restart entry, and a custom Horizon theme.
- Added helper scripts for restarting Waybar, Hyprpaper, SwayOSD, and Walker.
- Added launcher scripts for focusing or spawning apps, TUI apps, terminal-tmux sessions, and system menu actions.
- Added a power script for logout, reboot, and shutdown that attempts to terminate Hyprland clients before ending the session or powering off.
- Added a script for toggling the active audio sink.
- Added a script for linking repository scripts into the user's executable path.

### Changed

- Reworked Hyprland from a large single-file config into smaller Lua modules under `horizon/hypr`.
- Split Hyprland keybindings into focused app, media, and tiling modules.
- Refined Hyprland visual defaults, animation settings, input settings, and helper functions over several iterations.
- Updated shell initialization to load the repository-managed Bash modules instead of relying on the removed `config/.bashrc`.
- Iterated on Waybar layout, workspace icons, and module behavior after the initial bar configuration was introduced.
- Updated SwayOSD styling and connected volume/media keybindings to SwayOSD commands.
- Updated Hyprland window rules for desktop portals, XWayland drag handling, Spotify, Wiremix, Okular, Windows/winboat, virtual machines, Discord, Steam, Heroic, Modrinth, and Minecraft.
- Updated terminal launch behavior to support tmux-oriented terminal sessions.

### Removed

- Removed the original `config/.bashrc` after moving shell setup into the modular Bash files.
- Removed early Hyprland keybinding constants/main-mod files after consolidating the keybinding layout.

### Commit History Covered

- `33b5086` - Power menu & hyprland window rules
- `8c87eec` - Swayosd config & keybinds
- `1613be1` - Hyprland keybinds, uwsm, waybar & swayosd
- `aab60fc` - Hyprland keybindings and initial waybar config
- `eaf73c1` - Modular hypr keybinds
- `ca4a199` - Hyprland modular config
- `1406187` - Hyprland defaults
- `5d20fed` - Bashrc, nvim and tmux
- `fb4502a` - Initial commit
