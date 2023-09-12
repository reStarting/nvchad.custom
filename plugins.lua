local overrides = require("custom.configs.overrides")
local cmp = require("cmp")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		keys = { "s", "S" },
	},
	{
		"ggandor/flit.nvim",
		config = true,
		keys = { "f", "F", "t", "T" },
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = {
			"rust",
		},
		config = true,
	},
	{
		"echasnovski/mini.indentscope",
		event = "BufReadPre",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "NvimTree" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "BufReadPost",
		init = function()
			vim.g.gitblame_date_format = "%r"
		end,
	},
	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		dependencies = { "nvim-treesitter", "nvim-cmp" }, -- or require if not used so far
	},
	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
					pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
				end,
			})
		end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
	},

	-- Install a plugin
	-- To make a plugin not be loaded
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPost",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"rainbowhxch/accelerated-jk.nvim",
		event = "BufReadPost",
		keys = {
			{ "j", "<Plug>(accelerated_jk_gj)", desc = "accelerate j" },
			{ "k", "<Plug>(accelerated_jk_gk)", desc = "accelerate k" },
		},
	},
	{
		"github/copilot.vim",
		event = "InsertEnter",
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufReadPost",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					-- enable = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = {
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-a>"] = cmp.mapping(function(fallback)
					vim.fn["copilot#Dismiss"]()
					cmp.mapping.complete()(fallback)
				end, {
					"i",
					"s",
				}),
				-- ["<C-k>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping(function(fallback)
					local copilot_keys = vim.fn["copilot#Accept"]()
					if copilot_keys ~= "" and type(copilot_keys) == "string" then
						vim.api.nvim_feedkeys(copilot_keys, "i", true)
						cmp.mapping.abort()
					elseif cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		keys = { "<C-h>", "<C-l>", "<C-j>", "<C-k>" },
	},
	-- {
	--   "dstein64/vim-startuptime",
	--   cmd = "StartupTime",
	--   config = function()
	--     vim.g.startuptime_tries = 10
	--   end,
	-- },
	-- {
	--   "folke/noice.nvim",
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
