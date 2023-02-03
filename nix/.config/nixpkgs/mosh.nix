{ pkgs, lib, ... }:
let
  mtu = "1172";
  mtuFixMosh = pkgs.mosh.overrideAttrs (finalAttrs: oldAttrs: rec {
    configureFlags = oldAttrs.configureFlags or [] ++ [
      "--disable-completion"
    ];
    prePatch = ''
      ${oldAttrs.prePatch or ""}
      sed -i "s/\(DEFAULT_IPV[46]_MTU = \)[0-9]*;/\1${mtu};/g" src/network/network.h
    '';
  });
in
{
  home.packages = [ mtuFixMosh ];
}
