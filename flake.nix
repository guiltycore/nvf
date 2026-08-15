{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nvf = {
      url ="github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neowiki = {
      url = "github:echaya/neowiki.nvim";
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
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      packages.${system}.default =
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./modules
          ];

          extraSpecialArgs = {
            inherit neowiki;
          };
        }).neovim;
    
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
