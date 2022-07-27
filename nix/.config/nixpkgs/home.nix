{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "savoundg";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.alacritty
    pkgs.autoconf
    pkgs.automake
    pkgs.awscli
    pkgs.cmake
    pkgs.colordiff
    pkgs.cppcheck
    pkgs.curl
    pkgs.diffutils
    pkgs.dos2unix
    pkgs.fd
    pkgs.fzf
    pkgs.gitFull
    pkgs.gnutar
    pkgs.google-java-format
    pkgs.go
    pkgs.gradle
    pkgs.gzip
    pkgs.hexedit
    pkgs.htop
    pkgs.jq
    pkgs.lftp
    pkgs.maven
    pkgs.meld
    pkgs.meson
    pkgs.minicom
    pkgs.neovim
    pkgs.ninja
    pkgs.nmap
    pkgs.picocom
    pkgs.pkg-config
    pkgs.python3
    pkgs.ranger
    pkgs.rename
    pkgs.ripgrep
    pkgs.rpm
    pkgs.shellcheck
    pkgs.stow
    pkgs.tig
    pkgs.tmux
    pkgs.tree
    pkgs.universal-ctags
    pkgs.xxd
    pkgs.zip
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    pkgs.android-tools
    pkgs.buildah
    pkgs.chrpath
    pkgs.podman
    pkgs.radare2
  ];
}
