# NixOS Configuration for ARM (Apple Silicon)

Personal NixOS setup for **aarch64** systems (Apple Silicon Macs via UTM/Parallels).

## Features

- **GNOME Desktop** - Clean, minimal setup with curated extensions
- **Hyprland** - Wayland tiling compositor (optional)
- **Home Manager** - Declarative user environment
- **Flakes** - Reproducible builds
- **Auto-cleanup** - Daily garbage collection
- **Auto-upgrades** - Weekly system updates

## Structure

```
/etc/nixos/
├── flake.nix                    # Flake entry point
├── configuration.nix            # Main config (imports modules)
├── hardware-configuration.nix   # Auto-generated per machine
├── modules/
│   ├── desktop.nix              # GNOME, GDM, PipeWire
│   ├── development.nix          # Dev tools (git, nodejs, rust)
│   ├── packages.nix             # General apps
│   ├── bspwm-packages.nix       # bspwm packages (disabled by default)
│   ├── hyprland.nix             # Hyprland compositor
│   └── shell.nix                # Zsh configuration
├── home/
│   ├── abdo.nix                 # Home Manager entry point
│   └── modules/
│       ├── gnome.nix            # GNOME extensions & settings
│       ├── hyprland.nix         # Hyprland user config
│       ├── waybar.nix           # Waybar config
│       ├── zsh.nix              # Zsh aliases & settings
│       ├── git.nix              # Git configuration
│       └── shell-tools.nix      # CLI tools setup
└── rice-themes/                 # Theme presets
```

## Usage

**Rebuild system:**
```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

**Quick rebuild (alias):**
```bash
nsync "description of changes"
```

**Update packages:**
```bash
nix flake update && nsync "update packages"
```

## New Machine Setup

1. Install NixOS on ARM (generates `hardware-configuration.nix`)
2. Clone this repo:
   ```bash
   sudo rm -rf /etc/nixos/*
   sudo git clone https://github.com/asytuyf/nixos-config-arm /etc/nixos
   ```
3. Keep your generated `hardware-configuration.nix`
4. Build:
   ```bash
   sudo nixos-rebuild switch --flake /etc/nixos#nixos
   ```

## ARM-Specific Notes

- **Architecture:** `aarch64-linux` (Apple Silicon via VM)
- **Keyboard:** Belgian layout (`be`)
- **bspwm:** Disabled by default (X11 packages may have issues on ARM)
- **Gaming:** Steam/Proton not available on ARM
- **Spotify:** May need alternative (spicetify works)

## GNOME Extensions

Pre-configured extensions include:
- Blur My Shell
- PaperWM (tiling)
- Dash2Dock Lite
- Clipboard Indicator
- gTile
- And more...

## Differences from x86 Config

| Feature | x86 | ARM |
|---------|-----|-----|
| bspwm packages | Enabled | Disabled |
| Steam/Gaming | Yes | No |
| Spotify | Yes | Via web/alternatives |
| sops-nix secrets | Yes | No |

---

**NixOS 25.11** | **aarch64-linux** | **Flakes + Home Manager**
