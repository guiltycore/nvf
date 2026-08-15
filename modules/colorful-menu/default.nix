{ pkgs, ... }:
{
# NOTICE: Do not set indent width manually, use vim.bo.shiftwidth = xxx
  vim = {
    lazy.plugins = {
      "colorful-menu.nvim" = {
        package = pkgs.vimPlugins.colorful-menu-nvim;
        event = ["VimEnter"];
        after = builtins.readFile ./setup.lua;
      };
    };
  };
}
