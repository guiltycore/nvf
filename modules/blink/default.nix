{ pkgs, ...}:
{
# NOTICE: Do not set indent width manually, use vim.bo.shiftwidth = xxx
  vim = {
    lsp.lspkind.enable = true;
    autocomplete.blink-cmp = {
      enable = true;
      sourcePlugins = {
        Git = {
          enable = true;
          package = pkgs.vimPlugins.blink-cmp-git;
          module = "blink-cmp-git";
        };
        Spell = {
          enable = true;
          package = pkgs.vimPlugins.blink-cmp-spell;
          module = "blink-cmp-spell";
        };
      };
    };
    luaConfigRC.blink-cmp = builtins.readFile ./setup.lua;
  };
}
