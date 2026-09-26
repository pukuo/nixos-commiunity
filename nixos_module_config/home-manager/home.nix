{ config, pkgs, inputs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    niri = "niri";
    waybar = "waybar";
    ghostty = "ghostty";
    fuzzel = "fuzzel";
  };
in
{

  home.username = "guolisen";
  home.homeDirectory = "/home/guolisen";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild --option substituters https://mirrors.ustc.edu.cn/nix-channels/store switch --flake  ~/nixos-dotfiles#nexus";
      gc = "sudo nix-collect-garbage -d";
    };
    initExtra = ''
      export PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
    '';
  };

  programs.waybar.enable = true;
  programs.ghostty.enable = true;
  programs.fuzzel.enable = true;
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
      opts = {
        number = true;         # Show line numbers
        relativenumber = true; # Show relative line numbers

        shiftwidth = 2;        # Tab width should be 2
    };
    # Enable gruvbox
    colorschemes.gruvbox.enable = true;
  };

  home.packages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

}
