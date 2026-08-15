{ pkgs, ... }:
{
  imports = [
    ./modules
    ./config
  ];
  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
    extraPackages = [
      pkgs.nixfmt
      pkgs.tectonic
      pkgs.mermaid-cli
      pkgs.glab
      pkgs.ghostscript_headless
      pkgs.fd
      pkgs.lazygit
    ];
  };
}
