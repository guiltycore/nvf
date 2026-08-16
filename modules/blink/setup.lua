require("blink.cmp").setup({
  keymap = {
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up" },
    ["<C-f>"] = { "scroll_documentation_down" },
    ["<C-e>"] = { "cancel" },
    ["<C-Space>"] = { "show" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
  },

  cmdline = {
    enabled = true,

    completion = {
      menu = {
        auto_show = true,
      },
    },

    keymap = {
      ["<Tab>"] = { "accept" },
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev" },
    },
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,

      window = {
        border = "rounded",
      },
    },

    menu = {
      border = "rounded",
      winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpBorder",

      auto_show = function()
        local bt = vim.bo.buftype
        local ft = vim.bo.filetype

        if bt == "prompt" or bt == "nofile" then
          return false
        end

        return not vim.tbl_contains({
          "dropbar_menu",
          "snacks_picker_input",
        }, ft)
      end,

      draw = {
        components = {
          label = {
            width = {
              fill = true,
              max = 60,
            },
--[[
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,

            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
]]
           
            text = function(ctx)
              local highlights_info = require("colorful-menu").blink_highlights(ctx)
              
              vim.schedule(function()
                vim.notify(vim.inspect({
                  label = ctx.label,
                  result = highlights_info,
                }))
              end) 
              if highlights_info ~= nil then
                return highlights_info.label
              end

              return ctx.label
            end,

            highlight = function(ctx)
              local highlights = {}

              local highlights_info = require("colorful-menu").blink_highlights(ctx)

              if highlights_info ~= nil then
                highlights = highlights_info.highlights
              end

              for _, idx in ipairs(ctx.label_matched_indices) do
                table.insert(highlights, {
                  idx,
                  idx + 1,
                  --group = "BlinkCmpLabelMatch"
                  group = "BlinkCmpLabelMatchCustom",
                })
              end

              return highlights
            end, 
          },

          kind_icon = {
            text = function(ctx)
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
          },
        },

        -- Keep this as native Lua. Don't let nvf serialize it.
        columns = {
          { "kind_icon" },
          { "label", gap = 2 },
          { "kind", gap = 1 },
        },
      },
    },
  },

  signature = {
    enabled = true,

    window = {
      border = "rounded",
    },
  },

  snippets = {
    preset = "default",
  },

  sources = {
    default = {
      "lsp",
      "path",
      "buffer",
      "snippets",
      "git",
      "blinkcmpavante",
      "spell",
    },

    per_filetype = {
      TelescopePrompt = {},
      oil = {},
      DressingInput = {},
    },

    providers = {
      blinkcmpavante = {
        module = "blink-cmp-avante",
        name = "Avante",
        opts = {},
      },

      git = {
        module = "blink-cmp-git",
        name = "Git",

        enabled = function()
          return vim.tbl_contains({
            "octo",
            "gitcommit",
            "markdown",
          }, vim.bo.filetype)
        end,

        opts = {},
      },

      spell = {
        name = "Spell",
        module = "blink-cmp-spell",
        score_offset = -50,

        enabled = function()
          return vim.tbl_contains({
            "markdown",
            "text",
            "gitcommit",
            "md",
          }, vim.bo.filetype)
        end,

        opts = {
          enable_in_context = function()
            return true
          end,
        },
      },
    },
  },

  fuzzy = {
    implementation = "rust",

    sorts = {
      function(a, b)
        local sort = require("blink.cmp.fuzzy.sort")

        if a.source_id == "spell" and b.source_id == "spell" then
          return sort.label(a, b)
        end

        return sort.score(a, b)
      end,
    },
  },
})
