{ pkgs, ... }:
{
# NOTICE: Do not set indent width manually, use vim.bo.shiftwidth = xxx
  vim = {
    lazy.plugins = {
      "themery.nvim" = {
        package = pkgs.vimPlugins.themery-nvim;
        event = ["VimEnter"];
        after = builtins.readFile ./setup.lua;
      };
    };
  };
}
