{ ... }:
{
  imports = [
    ./nix
    ./python
    ./typescript
  ];

  vim = {
    lsp.enable = true;
    languages  = {
      enableTreesitter       = true;
      enableFormat           = true;
      enableDAP              = true;
      enableExtraDiagnostics = true;
    };
  };
}
