local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('go').setup {
	-- other setups ....
	capabilities = capabilities,
	-- other setups
}


local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
	group = format_sync_grp,
})

require("go.format").gofmt()    -- gofmt only
require("go.format").goimport() -- goimport + gofmt

-- Run gofmt on save

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').gofmt()
	end,
	group = format_sync_grp,
})

-- Run gofmt + goimport on save
