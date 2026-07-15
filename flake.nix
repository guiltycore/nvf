{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf = {
      url ="github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neowiki = {
      url = "github:echaya/neowiki.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      nvf,
      neowiki,
      ...
    }:
    {
      packages.x86_64-linux.default =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;

          modules = [
            ./config
          ];

          extraSpecialArgs = {
            inherit neowiki;
          };
        }).neovim;

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
