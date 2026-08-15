{ ... }:
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
  ];

  vim = {
    telescope.enable = true;
    notify.nvim-notify.enable = true;
    visuals.nvim-web-devicons.enable = true;
  };
}
