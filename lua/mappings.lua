require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>")
map("n", "<c-\\>", "<cmd>:TmuxNavigatePrevious<cr>")

map("n", "gw", "*N", { desc = "Find words" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<", "<cmd>vertical resize +5<cr>")
map("n", ">", "<cmd>vertical resize -5<cr>")
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "[", "<C-o>", { desc = "Jump back" })
map("n", "]", "<C-i>", { desc = "Jump forward" })

map("n", "<leader>gg", function()
  require("utils.term").float_term { "lazygit" }
end, { desc = "Open lazygit" })

map("v", "<", "<gv", { desc = "indenting" })
map("v", ">", ">gv", { desc = "indenting" })

map("i", "<C-j>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, noremap = true, expr = true })

map("n", "gr", "<cmd>Lspsaga finder<cr>", { desc = "References" })
map("n", "gd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definition" })
map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Declaration" })
map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "References" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover" })
map("n", "go", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto Implementation" })
map("n", "ga", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
