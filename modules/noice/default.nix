{ ... }:
{
  vim.ui.noice = {
    enable = true;

    setupOpts = {
      cmdline = {
        enabled = true;
        view = "cmdline_popup";

        opts = {};

        format = {
          cmdline = {
            pattern = "^:";
            icon = "";
            lang = "vim";
          };

          search_down = {
            kind = "search";
            pattern = "^/";
            icon = " ";
            lang = "regex";
          };

          search_up = {
            kind = "search";
            pattern = "^%?";
            icon = " ";
            lang = "regex";
          };

          filter = {
            pattern = "^:%s*!";
            icon = "$";
            lang = "bash";
          };

          lua = {
            pattern = [
              "^:%s*lua%s+"
              "^:%s*lua%s*=%s*"
              "^:%s*=%s*"
            ];
            icon = "";
            lang = "lua";
          };

          help = {
            pattern = "^:%s*he?l?p?%s+";
            icon = "󰋖";
          };

          input = {
            view = "cmdline_input";
            icon = "󰥻 ";
          };
        };
      };

      messages = {
        enabled = true;
        view = "notify";
        view_error = "notify";
        view_warn = "notify";
        view_history = "messages";
        view_search = "virtualtext";
      };

      popupmenu = {
        enabled = true;
        backend = "nui";
        kind_icons = {};
      };

      redirect = {
        view = "popup";
        filter = {
          event = "msg_show";
        };
      };

      notify = {
        enabled = false;
        view = "notify";
      };

      lsp = {
        progress = {
          enabled = false;
          format = "lsp_progress";
          format_done = "lsp_progress_done";
          throttle = 1000 / 60;
          view = "mini";
        };

        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = false;
          "vim.lsp.util.stylize_markdown" = false;
          "cmp.entry.get_documentation" = false;
        };

        hover = {
          enabled = true;
          silent = false;
          view = null;
          opts = {};
        };

        signature = {
          enabled = false;

          auto_open = {
            enabled = true;
            trigger = true;
            luasnip = true;
            throttle = 50;
          };

          view = null;
          opts = {};
        };

        message = {
          enabled = true;
          view = "notify";
          opts = {};
        };

        documentation = {
          view = "hover";

          opts = {
            lang = "markdown";
            replace = true;
            render = "plain";
            format = [ "{message}" ];

            win_options = {
              concealcursor = "n";
              conceallevel = 3;
            };
          };
        };
      };

      health = {
        checker = true;
      };

      presets = {
        bottom_search = true;
        command_palette = false;
        long_message_to_split = false;
        inc_rename = false;
        lsp_doc_border = false;
      };

      throttle = 1000 / 60;

      views = {};

      routes = [
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "written";
          };

          opts.skip = true;
        }

        {
          filter = {
            event = "msg_show";

            any = [
              { find = "yanked"; }
              { find = "copied"; }
              { find = "search"; }
              { find = "line changed"; }
              { find = "lines changed"; }
              { find = "Pattern not found"; }
              { find = "more line"; }
              { find = "fewer line"; }
            ];
          };

          opts.skip = true;
        }
      ];

      status = {};
      format = {};
    };
  };
}
