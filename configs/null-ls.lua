local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins
local formatting = b.formatting
local lint = b.diagnostics

local sources = {

	-- webdev stuff
	formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	formatting.prettier, -- so prettier works only on these filetypes

	-- Lua
	formatting.stylua,

	-- cpp
	formatting.clang_format,
	lint.shellcheck,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
