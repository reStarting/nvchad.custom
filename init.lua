local autocmd = vim.api.nvim_create_autocmd

vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.g.copilot_tab_fallback = ""
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd({ "VimEnter" }, {
  callback = function(data)
    local dir = vim.fn.isdirectory(data.file) == 1
    if not dir then
      return
    end
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
  end,
})
-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
autocmd("BufWritePost", {
               callback = function()
    vim.lsp.buf.format()
  end,
})
autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "q",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})
