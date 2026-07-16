{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
  ];

  home.packages = with pkgs; [
    vimPlugins.tabby-nvim
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
