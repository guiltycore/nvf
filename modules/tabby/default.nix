{ pkgs, ... }:
{
  vim = {

    options = {
      showtabline = 2;
      tabline     = "%!v:lua.TabbyRenderTabline()";
    }

    extraPlugins = {
      tabby = {
        package = pkgs.vimPlugins.tabby-nvim;
        setup = builtins.readFile ./setup.lua; 
      };
    };
  };
}
