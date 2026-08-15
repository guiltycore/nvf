{ pkgs, ... }:
{
# NOTICE: Do not set indent width manually, use vim.bo.shiftwidth = xxx
  vim = {
    lazy.plugins = {
      "snacks.nvim" = {
        package = pkgs.vimPlugins.snacks-nvim;
        event = ["VimEnter"];
        after = ''
          ${builtins.readFile ./setup.lua}
          ${builtins.readFile ./keys.lua}
          ${builtins.readFile ./toggles.lua}
        '';
                                #     after = builtins.readFile ./setup.lua;
      };
    };
  };
}
