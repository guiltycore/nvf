{ pkgs, lib, ... }: {
  vim = {
    lsp.lspkind.enable = true;
    ui.colorful-menu-nvim = {
      enable = true;
    };
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      sourcePlugins = {
        Git = {
          enable = true;
          package = pkgs.vimPlugins.blink-cmp-git;
          module = "blink-cmp-git";
        };
        Spell = {
          enable = true;
          package = pkgs.vimPlugins.blink-cmp-spell;
          module = "blink-cmp-spell";
        };
      };
      setupOpts = {
        cmdline = {
          enabled = true;
          #          completion.menu.auto_show = true;
          /*keymap = {
            "<Tab>" = [ "accept" ];
            "<C-j>" = [ "select_next" ];
            "<C-k>" = [ "select_prev" ];
          };*/
        };
        
        keymap.preset = "enter";
        /*keymap = {
          "<C-j>" = [ "select_next" "fallback" ];
          "<C-k>" = [ "select_prev" "fallback" ];
          "<C-b>" = [ "scroll_documentation_up" ];
          "<C-f>" = [ "scroll_documentation_down" ];
          "<C-e>" = [ "cancel" ];
          "<C-Space>" = [ "show" ];
          "<CR>" = [ "accept" "fallback" ];
          "<Tab>" = [ "snippet_forward" "fallback" ];
          "<S-Tab>" = [ "snippet_backward" "fallback" ];
          "<C-s>" = [ "show_signature" "hide_signature" "fallback" ];
        };*/
        signature = {
          enabled = true;
          window.border = "rounded";
          # If transperent menu is tomuch of a pain delete the line below
          winhighlight = "Normal:NormalFloat,FloatBorder:BlinkCmpBorder";
        };
        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
            window.border = "rounded";
          # If transperent menu is tomuch of a pain delete the line below
            winhighlight = "Normal:NormalFloat,FloatBorder:BlinkCmpBorder";
          };
          list.selection = {
            preselect = false;
            auto_insert = true;
          };
          menu = {
            border = "rounded";
            #winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpBorder";
            winhighlight = "Normal:NormalFloat,FloatBorder:BlinkCmpBorder";
            auto_show = true;
          # If transperent menu is tomuch of a pain delete the line below
            #ghost_text.enabled = true;
            #            keyword.range = "full";
            draw = {
              columns = lib.generators.mkLuaInline ''
                  {
                    { "kind_icon" },
                    { "label", gap = 2 },
                    { "kind", gap = 1 },
                  }
                '';
              components = {
                kind_icon = {
                  text = lib.generators.mkLuaInline ''          
                      function(ctx)
                        local git_icons = {
                          Commit = "",
                          Mention = "",
                          PR = "",
                          MR = "",
                          Issue = "",
                        }

                        if git_icons[ctx.kind] then
                          return git_icons[ctx.kind] .. ctx.icon_gap
                        end

                        if ctx.source_id == "spell" then
                          return "󰓆"
                        end

                        return require("lspkind").symbol_map[ctx.kind] or ""
                      end,
                    '';
                };
                label = {
                  highlight = lib.generators.mkLuaInline ''
                      function(ctx)
                        local highlights = {}

                        local highlights_info = require("colorful-menu").blink_highlights(ctx)

                        if highlights_info ~= nil then
                          highlights = highlights_info.highlights
                        end

                        for _, idx in ipairs(ctx.label_matched_indices) do
                          table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatchCustom" })
                        end

                        return highlights
                      end
                    '';

                  text = lib.generators.mkLuaInline ''
                      function(ctx)
                        local highlights_info = require("colorful-menu").blink_highlights(ctx)
                        
                        if highlights_info ~= nil then
                          return highlights_info.label
                        end

                        return ctx.label
                      end
                    '';
                  width = { fill = true; max = 60; };
                };
              };
            };
          };
        };
        fuzzy.implementation = "prefer_rust";

        
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "git"
            "spell"
            "buffer"
           ];
          providers = {
            buffer.score_offset = -7;
            git = {
              module = "blink-cmp-git";
              name = "Git";

              enabled = lib.mkLuaInline ''
                function()
                  return vim.tbl_contains({
                    "octo",
                    "gitcommit",
                    "markdown",
                  }, vim.bo.filetype)
                end
              '';

              opts = {};
            };

            spell = {
              name = "Spell";
              module = "blink-cmp-spell";
              score_offset = -50;

              enabled = lib.mkLuaInline ''
                function()
                  return vim.tbl_contains({
                    "markdown",
                    "text",
                    "gitcommit",
                    "md",
                  }, vim.bo.filetype)
                end
              '';

              opts = {
                enable_in_context = lib.mkLuaInline ''
                  function()
                    return true
                  end
                '';
              };
            };
          };
        };
      };
    };
  };
}
