{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
  ];

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;

    extraPackages = [
      pkgs.nixfmt
    ];
  };
}
