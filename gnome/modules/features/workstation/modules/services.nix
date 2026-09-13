{
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
    fprintd.enable = true;
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    pulseaudio.enable = false;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    pcscd.enable = true;
  };
}
