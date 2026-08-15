{ pkgs, ... }:
{
  vim = {

    options = {
      showtabline = 2;
      signcolumn  = "yes";
      cmdheight   = 0;
    };

    lazy.plugins = {
      "tabby.nvim" = {
        package = pkgs.vimPlugins.tabby-nvim;

        event   = ["VimEnter"];

        after   = builtins.readFile ./setup.lua;
      };
    };
  };
}
