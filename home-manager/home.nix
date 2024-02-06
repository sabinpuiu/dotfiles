# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
  ./neovim.nix
  ./theme.nix
  ./wezterm.nix
  ./tmux.nix
  ./browser.nix
  ./dconf.nix
  ./hyprland.nix
  ./ags.nix
  ./stm.nix 
  ./sh.nix
  ./sway.nix
  ./packages.nix
  ./neofetch.nix
  ./vscode.nix
  ./git.nix
     ];
      


  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "sabin";
    homeDirectory = "/home/sabin";
  };
  programs.vscode.extensions = [
    # all the theme options will be available as overrides, these are defaults:
    (pkgs.catppuccin-vsc.override {
      accent = "pink";
      boldKeywords = true;
      italicComments = true;
      italicKeywords = true;
      extraBordersEnabled = false;
      workbenchMode = "default";
      bracketMode = "rainbow";
      colorOverrides = {
           mocha = {
                    red = "#e55f86";
                    green = "#00D787";
                    peach = "#EBFF71";
                    blue = "#50a4e7";
                    mauve = "#9076e7";
                    sky = "#50e6e6";
                    pink = "#e781d6";

                    maroon = "#d15577";
                    teal = "#43c383";
                    yellow = "#d8e77b";
                    lavender = "#4886c8";
                    flamingo = "#8861dd";
                    sapphire = "#43c3c3";
                    rosewater = "#d76dc5";

                    text = "#e7e7e7";
                    subtext1 = "#dbdbdb";
                    subtext2 = "#cacaca";

                    overlay2 = "#b2b5b3";
                    overlay1 = "#a8aba9";
                    overlay0 = "#9ea19f";

                    surface2 = "#353331";
                    surface1 = "#2f2e2d";
                    surface0 = "#2c2a2a";

                    base = "#171717";
                    mantle = "#111111";
                    crust = "#0a0a0a";
                };
                latte = {
                    base = "#fffffa";
                    mantle = "#e7e8e9";
                    crust = "#d3d4d5";
                };

        };
    })
  ];

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
