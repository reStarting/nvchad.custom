-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",
  -- transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLineNr = {
      fg = "yellow",
    },
  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
  statusline = {
    theme = "vscode_colored",
    -- overriden_modules = function(modules)
    --   modules[5] = function() return require("noice").api.status.command.get() end
    -- end,
  },
  cmp = {
    -- style = "atom_colored",
    icons_left = true,
  },
  -- hl_add = {
  --   NvimTreeOpenedFolderName = { fg = "green", bold = true },
  -- },
}

return M
