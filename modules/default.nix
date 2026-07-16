{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
    ./tabby
  ];

  vim = {
    #statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    notify.nvim-notify.enable = true;

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
    extraPackages = [
      pkgs.nixfmt
    ];
  };
}
