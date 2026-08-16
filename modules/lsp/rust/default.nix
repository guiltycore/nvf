{ ... }:
{
  vim = {
    languages.rust= {
      enable = true;
      extensions = {
        crates-nvim.enable = true;
        ferris-nvim.enable = true;
        #rustaceanvim = true;
      };
    };
  };
}
