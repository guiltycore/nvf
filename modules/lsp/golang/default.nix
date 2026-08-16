{ ... }: {
  vim = {
    # 1. Activer les fonctionnalités de base requises

    # 2. Configurer spécifiquement le langage Go
    languages.go = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true;
      
      # Options additionnelles courantes (selon vos préférences)
      # lsp.package = pkgs.gopls;          # Optionnel : pour forcer une version spécifique
      # dlv.enable = true;                 # Optionnel : active le débogueur Delve via nvim-dap
    };
  };
}

