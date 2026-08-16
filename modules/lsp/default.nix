{ ... }:
{
  imports = [
    ./nix
    ./python
    ./typescript
    ./golang
    ./rust
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
