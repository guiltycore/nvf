require("snacks").setup({
		picker = {
			enabled = true,
			ui_select = true,
			icons = {
				git = {
					enabled = true,
					-- commit = "󰜘 ",
					commit = " ",
					staged = "●",
					added = "",
					deleted = "",
					ignored = " ",
					modified = " ",
					-- modified = "○",
					renamed = "",
					unmerged = " ",
					untracked = "?",
				},
			},
			sources = {
				files = {
					layout = "vscode",
					-- exclude = { "node_modules", ".git", "dist", "build", "target" },
				},
				lsp_workspace_symbols = { layout = "vertical" },
				cliphist = {
					finder = "system_cliphist",
					format = "text",
					layout = "dropdown",
					preview = "preview",
					confirm = { "copy", "close" },
				},
				lsp_symbols = {
					layout = {
						preset = "sidebar",
						layout = { position = "right", width = 0.25 },
					},
				},
				projects = {
					layout = "vscode",
					dev = { "~/dev", "~/IdeaProjects" },
					patterns = {
						"pom.xml",
						"mvnw.cmd",
						".git",
						"_darcs",
						".hg",
						"package.json",
						"Makefile",
					},
				},
				diagnostics = { layout = "ivy" },
				keymaps = { layout = "bottom", confirm = false },
				git_branches = { layout = "vscode" },
				explorer = {
					hidden = false,
					follow_file = true,
					layout = { preset = "sidebar", preview = false },
					win = {
						input = {
							keys = {
								["<C-t>"] = { "tab", mode = { "i", "n" } },
							},
						},
						list = {
							keys = {
								["<C-t>"] = "tab",
							},
						},
					},
				},
			},
		},

		explorer = {
			enabled = true,
			trash = true,
			replace_netrw = false,
		},

		gh = {
			enabled = true,
			wo = {
				breakindent = true,
				wrap = true,
				showbreak = "",
				linebreak = true,
				number = false,
				relativenumber = false,
				foldexpr = "v:lua.vim.treesitter.foldexpr()",
				foldmethod = "expr",
				concealcursor = "n",
				conceallevel = 2,
				list = false,
			},
			bo = {},
			diff = { min = 4, wrap = 80 },
			scratch = { height = 15 },
			icons = {
				logo = " ",
				user = " ",
				checkmark = " ",
				crossmark = " ",
				block = "■",
				file = " ",
				checks = {
					pending = " ",
					success = " ",
					failure = "",
					skipped = " ",
				},
				issue = {
					open = " ",
					completed = " ",
					other = " ",
				},
				pr = {
					open = " ",
					closed = " ",
					merged = " ",
					draft = " ",
					other = " ",
				},
				review = {
					approved = " ",
					changes_requested = " ",
					commented = " ",
					dismissed = " ",
					pending = " ",
				},
				merge_status = {
					clean = " ",
					dirty = " ",
					blocked = " ",
					unstable = " ",
				},
				reactions = {
					thumbs_up = "👍",
					thumbs_down = "👎",
					eyes = "👀",
					confused = "😕",
					heart = "❤️",
					hooray = "🎉",
					laugh = "😄",
					rocket = "🚀",
				},
			},
		},

		blame_line = {
			width = 0.6,
			height = 0.6,
			border = true,
			title = " Git Blame ",
			title_pos = "center",
			ft = "git",
		},

		indent = {
			enabled = true,
			-- priority = 1,
			char = "│",
			only_scope = false,
			only_current = false,

			scope = {
				enabled = true,
				priority = 200,
				char = "│",
				underline = false,
				only_current = false,
				hl = "SnacksIndentScope",
			},
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				style = "out",
				easing = "outQuad",
				duration = { step = 20, total = 400 },
			},
			chunk = {
				enabled = true,
				only_current = false,
				priority = 200,
				hl = "SnacksIndentChunk",
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					horizontal = "─",
					vertical = "│",
					arrow= "─",
				},
			},
                --filter = function(buf)
                --		return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
		--	end,
		},

		image = { enabled = true },

		dim = {
			enabled = true,
			scope = { min_size = 5, max_size = 20, siblings = true },
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				easing = "outQuad",
				duration = { step = 20, total = 300 },
			},
			filter = function(buf)
				return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
			end,
		},

		words = {
			enabled = true,
			modes = { "n" },
		},

		scope = {
			enabled = true,
			cursor = true,
			edge = true,
			filter = function(buf)
				return vim.bo[buf].buftype == "" and vim.b[buf].snacks_scope ~= false and vim.g.snacks_scope ~= false
			end,
			treesitter = {
				enabled = true,
				injections = true,
				blocks = {
					enabled = true,
					"function_declaration",
					"function_definition",
					"method_declaration",
					"method_definition",
					"class_declaration",
					"class_definition",
					"do_statement",
					"while_statement",
					"repeat_statement",
					"if_statement",
					"for_statement",
				},
				field_blocks = { "local_declaration" },
			},
		},

		scroll = { enabled = false },
		notifier = { enabled = true, timeout = 3000 },
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				--{ section = "startup" },
			},
		},
		input = { enabled = false },
		quickfile = { enabled = false },
		statuscolumn = { enabled = false },
})
