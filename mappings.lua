---@type MappingsTable
local M = {}

M.disabled = {
  n = {
		["<C-h>"] = "",
		["<C-l>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",

  }
}

M.general = {
	n = {
		["<leader>qq"] = { "<cmd>qa<cr>", "Quit All" },
		-- ["j"] = {"v:count == 0 ? 'gk' : 'k'", "better down"}
		-- Move Lines
		-- map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
		-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
		-- map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
		-- map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
		-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
		-- map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
		["<leader><space>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>/"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<C-\\>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},
		-- map("n", "gw", "*N")
		-- map("x", "gw", "*N")
		["gw"] = { "*N", "Find words" },
		-- better indenting
		-- map("v", "<", "<gv")
		-- map("v", ">", ">gv")
		-- map("n", ">", "<cmd>vertical resize -5<cr>")
		-- map("n", "<", "<cmd>vertical resize +5<cr>")
		["<"] = { "<cmd>vertical resize +5<cr>" },
		[">"] = { "<cmd>vertical resize -5<cr>" },
		-- map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
		-- map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
		["<leader>-"] = { "<C-W>s", "Split window below" },
		["<leader>|"] = { "<C-W>v", "Split window right" },
		["<leader>gg"] = {
			function()
				require("custom.term").float_term({ "lazygit" })
			end,
			"Open lazygit",
		},
		-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
		["<leader>wd"] = { "<C-W>c", "Delete window" },
	},
	v = {
		["<"] = { "<gv", "indenting" },
		[">"] = { ">gv", "indenting" },
	},
	t = {
		["<C-\\>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},
	},
}

-- more keybinds!

M.lspconfig = {
	plugin = true,
	n = {
		["gr"] = { "<cmd>Lspsaga finder<cr>", "References" },
		["gd"] = {
			"<cmd>Lspsaga peek_definition<cr>",
			"Peek Definition",
		},
		["gh"] = { "<cmd>Lspsaga finder<CR>", "References" },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
		["go"] = { "<cmd>Lspsaga outline<CR>", "Outline" },
		["gi"] = { "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
		["ga"] = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
		["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
	},
}

M.copilot = {
	i = {
		["<C-j>"] = {
			function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end,
			"Copilot Accept",
			{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		},
	},
}

return M
