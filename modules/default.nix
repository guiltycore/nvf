{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
  ];

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
    startPlugins = [
      pkgs.vimPlugins.tabby-nvim
    ];
    extraPackages = [
      pkgs.nixfmt
    ];
  };
}
