local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "yaml",
    "rust",
    "go",
    "vue",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      node_incremental = "<cr>",
      scope_incremental = "<nop>",
      node_decremental = "<bs>",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  -- view = {
  --   -- side = "right",
  --   width = 35,
  --   mappings = {
  --     list = {
  --       -- 分屏打开文件
  --       { key = "|", action = "vsplit" },
  --       { key = "-", action = "split" },
  --       -- 显示隐藏文件
  --       { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  --       { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  --     },
  --   },
  -- },
}

return M
