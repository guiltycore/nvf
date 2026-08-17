{ ... }:
{
  imports = [
    ./neowiki
    ./tabby
    ./incline
    ./maximize
    ./lualine
    ./snacks
    ./toggleterm
    ./blink
    ./lazygit
    ./lsp
    ./treesitter
    ./clipboard
    ./noice
  ];

  vim = {
    telescope.enable = true;
    notify.nvim-notify.enable = true;
    visuals.nvim-web-devicons.enable = true;

    theme = {
      enable = true;
      #name = "catppuccin";
      name = "github";
      #style = "mocha";
      style = "dark_dimmed";
      #style = "dark";
      transparent = true;
    };
  };
}
