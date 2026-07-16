{ pkgs, ... }:
{
  vim = {
    extraPackages = [
      pkgs.vimPlugins.tabby-nvim
    ];
  };
}
