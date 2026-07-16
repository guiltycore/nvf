{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
    ./tabby.nix
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
    extraPackages = [
      pkgs.nixfmt
    ];
  };
}
