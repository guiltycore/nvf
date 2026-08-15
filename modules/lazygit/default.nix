{ pkgs, ... }:
{
# NOTICE: Do not set indent width manually, use vim.bo.shiftwidth = xxx
  vim = {
    lazy.plugins = {
      "lazygit.nvim" = {
        package = pkgs.vimPlugins.lazygit-nvim;
        event = ["VimEnter"];
      };
    };
  };
}
