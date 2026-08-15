{ pkgs, lib, ... }:
{
  vim = {

    options = {
      showtabline = 2;
      signcolumn  = "yes";
    };

    lazy.plugins = {
      "maximize.nvim" = {
        package = pkgs.vimUtils.buildVimPlugin {
          pname = "maximize.nvim";
          version = "unstable";

          src = pkgs.fetchFromGitHub {
            owner = "declancm";
            repo = "maximize.nvim";
            rev = "d688b66344b03ee6e5a32a0a40af85d174490af8";
            hash = "sha256-rwnvX+Sul+bwESZtpqbvaDJuk49SV9tLUnvgiAH4VMs=";
          };
        };
        after   = builtins.readFile ./setup.lua;
        event   = ["VimEnter"];

      };
    };
  };
}
