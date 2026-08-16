{ pkgs, ... }:
{
  imports = [
    ./neowiki
    ./tabby
    ./incline
    ./maximize
    ./lualine
    ./snacks
    ./colorful-menu
    ./toggleterm
    ./blink
    ./lazygit
    ./lsp
    ./treesitter
  ];

  vim = {
    telescope.enable = true;
    notify.nvim-notify.enable = true;
    visuals.nvim-web-devicons.enable = true;

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = true;
    };
  };
}
