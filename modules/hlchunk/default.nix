{ pkgs, ... }:
{
# NOTICE: Do not set indent width manually, use vim.bo.shiftwidth = xxx
  vim = {
    lazy.plugins = {
      "hlchunk.nvim" = {
        package = pkgs.vimPlugins.hlchunk-nvim;
        event = ["VimEnter"];
        after = builtins.readFile ./setup.lua;
      };
    };
  };
}
