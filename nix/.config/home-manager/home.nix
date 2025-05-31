{ config, lib, pkgs, ... }:

{
  imports = [
    ./nvim.nix
    ./mosh.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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
    pkgs.eza
    pkgs.fd
    pkgs.feh
    pkgs.file
    pkgs.findutils
    pkgs.fzf
    pkgs.gawk
    pkgs.gitFull
    pkgs.gnugrep
    pkgs.gnused
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
    pkgs.pbzip2
    (pkgs.python3.withPackages (ppkgs: [
      ppkgs.pip
    ]))
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
    (pkgs.toybox.override {
      enableMinimal = true;
      extraConfig = ''
        CONFIG_TIMEOUT=y
        CONFIG_WATCH=y
      '';
    })
    pkgs.tree
    pkgs.universal-ctags
    pkgs.unzip
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
    pkgs.keepassxc
    pkgs.libmtp
    pkgs.podman
    pkgs.rpm
    pkgs.shotwell
    pkgs.xclip
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    pkgs.reattach-to-user-namespace
  ];
}
