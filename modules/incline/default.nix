{ pkgs, ... }:
{
  vim = {

    options = {
      showtabline = 2;
    };

    lazy.plugins = {
      "incline.nvim" = {
        package = pkgs.vimPlugins.incline-nvim;

        dependencies = [
          pkgs.vimPlugins.nvim-web-devicons
        ];

        after = builtins.readFile ./setup.lua;
      };
    };
  };
}
