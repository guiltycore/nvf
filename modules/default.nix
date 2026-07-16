{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
  ];

  vim = {
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
  

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      ts.enable = true;
      python.enable = true;
    };

    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
    startPlugins = [
      pkgs.vimPlugins.tabby-nvim
    ];
    extraPackages = [
      pkgs.nixfmt
    ];
  };
}
