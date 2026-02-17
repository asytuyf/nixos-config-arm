{ config, pkgs, ... }:

{
  # X11 and Desktop Environment
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "be";
    variant = "";
  };
  console.keyMap = "fr";

  # GNOME utilities
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.user-themes
    gnomeExtensions.places-status-indicator
  ];

  # Sound with PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # alsa.support32Bit = true;  # REMOVED: x86-64 only
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;
}
