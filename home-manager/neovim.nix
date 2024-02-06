{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.desktopEntries."nvim" = {
    name = "NeoVim";
    comment = "Edit text files";
    icon = "nvim";
    # xterm is a symlink and not actually xterm
    exec = "xterm -e ${pkgs.neovim}/bin/nvim %F";
    categories = [ "TerminalEmulator" ];
    terminal = false;
    mimeType = [ "text/plain" ];
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withRuby = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [
    lazygit
    go
    nil
    marksman
      gnumake
      cargo
      ripgrep
      gcc
      unzip
      wget
      curl
      tree-sitter
      luajitPackages.luarocks
      python311Packages.pynvim
      php82Packages.composer
      python311Packages.pip
    ];
  };

 xdg.configFile.nvim.source = ../nvim;
}
