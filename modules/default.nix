{ pkgs, ... }:
{
  imports = [
    ./neowiki.nix
    ./tabby
    ./incline
    ./maximize
    ./lualine
    ./snacks
    ./colorful-menu
    ./toggleterm
    ./blink
    ./lazygit
  ];
  vim = {
    telescope.enable = true;
    notify.nvim-notify.enable = true;
    lsp.enable = true;
    visuals.nvim-web-devicons.enable = true;
    options = {
      shell = "/bin/sh";
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
    };
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
    luaConfigPre = ''
vim.api.nvim_create_autocmd("VimEnter", {
  command = "silent !kitty @ set-spacing padding=0 margin=0"
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  command = "silent !kitty @ set-spacing padding=25" -- Adjust values to your default
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		if vim.t.maximized then
			require("maximize").restore()
		end
	end,
})
'';
  };
}
