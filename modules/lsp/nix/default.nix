{ ... }:
{
  vim = {
    languages.nix = {
      enable = true;
      format = {
        enable = true;
        type = [ "alejandra" ];
      };
      lsp = {
        enable  = true;
        servers = [ "nil" ];
      };
    };
  };
}
