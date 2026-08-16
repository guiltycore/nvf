{ ... }:
{
  vim = {
    languages.python = {
      enable = true;
      dap = {
        enable   = true;
        debugger = [ "debugpy" ];
      };
      format = {
        enable = true;
        type   = [ "ruff" ];
      };
      lsp = {
        enable  = true;
        servers = [ "basedpyright"
                    "python-lsp-server"
                    "ruff" ];
      };
    };

  };
}
