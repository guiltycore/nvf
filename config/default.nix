{ ... }:
{
  vim = {
    options = {
      shell          = "/bin/sh";
      tabstop        = 2;
      shiftwidth     = 2;
      softtabstop    = 2;
      expandtab      = true;
      autoindent     = true;
      smartindent    = false;
      wrap           = false;
      laststatus     = 3;
      ignorecase     = true;
      smartcase       = true;
      termguicolors  = true;
      signcolumn     = "yes";
      background     = "dark";
      backspace      = "indent,eol,start";
      scrolloff      = 10;
      splitright     = true;
      splitbelow     = true;
      iskeyword      = {
#        append       = "_";
        remove       = "_";
      };
      swapfile       = false;
      viewoptions    = "folds,cursor,slash,unix";
      guicursor      = "n-v-c:block-blinkon500,i-ci:ver25-blinkon500,r-cr:hor20,o:hor50,a:blinkwait700-blinkon400-blinkoff250";
      mousemoveevent = true;
    };
    #highlight = {
    #  BlinkCmpLabelMatchCustom = {
    #    fg = "#f38ba8";
    #    bold = true;
    #    underline = true;
    #  };
    #};
    luaConfigRC.end4-theme = builtins.readFile ./theme/end4-theme.lua;
    luaConfigRC.core        = builtins.readFile ./core.lua;
    luaConfigRC.diagnostics = builtins.readFile ./diagnostics.lua;
    luaConfigPre            = builtins.readFile ./pre.lua;
  };
}
