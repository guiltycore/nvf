{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
    ./tabby
    ./incline
  ];

  vim = {
    #statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    notify.nvim-notify.enable = true;
    lsp.enable = true;
    visuals.nvim-web-devicons.enable = true;

    languages = {
      enableTreesitter = true;

      nix.enable = true;
      typescript.enable = true;
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
