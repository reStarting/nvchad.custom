-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = {
    Comment = {
      italic = true,
    },
    CursorLineNr = {
      fg = "yellow",
    },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
  statusline = {
    -- overriden_modules = function(modules)
    --   modules[5] = function() return require("noice").api.status.command.get() end
    -- end,
  },
  tabufline = {
    lazyload = false,
  },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
