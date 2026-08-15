{ pkgs, ... }:
{
# NOTICE: Do not set indent width manually, use vim.bo.shiftwidth = xxx
  vim = {
    lazy.plugins = {
      "toggleterm.nvim" = {
        package = pkgs.vimPlugins.toggleterm-nvim;
        event = ["VimEnter"];
        after = builtins.readFile ./setup.lua;
      };
    };
  };
}
