{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with nodePackages_latest; with gnome; [
    sway
    # colorscript
    (import ./colorscript.nix { inherit pkgs; })

    # gui
(mpv.override { scripts = [mpvScripts.mpris]; })
    libreoffice    gimp
    icon-library
    dconf-editor 
    vesktop
    keepassxc
    bottles

    # tools
    bat
    eza
    fd
    ripgrep
    fzf
    socat
    jq
    acpi
    inotify-tools
    ffmpeg
    libnotify
    killall
    zip
    unzip
    glib
    vscode
    neovim

    # hyprland
    wl-gammactl
    wl-clipboard
    wf-recorder
    hyprpicker
    wayshot
    swappy
    slurp
    imagemagick
    pavucontrol
    brightnessctl
    swww

    # fun
    glow
    slides
    skate
    yabridge
    yabridgectl
    wine-staging
    distrobox

    # langs
 nodejs
    gjs
    bun
    cargo
    go
    gcc
    typescript
    eslint
  ];
}
