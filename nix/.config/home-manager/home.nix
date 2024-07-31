{ config, lib, pkgs, ... }:

{
  imports = [ ./mosh.nix ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "savoundg";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    extraPython3Packages = pyPkgs: with pyPkgs; [
      pip
    ];
  };

  home.packages = [
    pkgs.alacritty
    pkgs.autoconf
    pkgs.automake
    pkgs.awscli
    pkgs.bat
    pkgs.ccls
    pkgs.cmake
    pkgs.colordiff
    pkgs.cppcheck
    pkgs.curl
    pkgs.diffutils
    pkgs.dos2unix
    pkgs.fd
    pkgs.feh
    pkgs.fzf
    pkgs.gawk
    pkgs.gitFull
    pkgs.gnutar
    pkgs.google-java-format
    pkgs.go
    pkgs.gradle
    pkgs.gzip
    pkgs.hexedit
    pkgs.highlight
    pkgs.htop
    pkgs.jq
    pkgs.lftp
    pkgs.kitty
    pkgs.maven
    pkgs.meld
    pkgs.meson
    pkgs.minicom
    pkgs.ninja
    pkgs.nmap
    pkgs.picocom
    pkgs.pkg-config
    pkgs.python3
    pkgs.radare2
    pkgs.ranger
    pkgs.rename
    pkgs.ripgrep
    pkgs.rustup
    pkgs.shellcheck
    pkgs.stow
    pkgs.wget
    pkgs.tig
    pkgs.tmux
    pkgs.tree
    pkgs.universal-ctags
    pkgs.xxd
    pkgs.xz
    pkgs.zip
    pkgs.zstd
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    pkgs.android-tools
    pkgs.buildah
    pkgs.chrpath
    pkgs.eog
    pkgs.evince
    pkgs.podman
    pkgs.rpm
    pkgs.shotwell
  ];
}
