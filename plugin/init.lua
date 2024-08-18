local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

require('go').setup({
	-- notify: use nvim-notify
	notify = false,
	-- auto commands
	auto_format = true,
	auto_lint = true,
	-- linters: revive, errcheck, staticcheck, golangci-lint
	linter = 'revive',
	-- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
	linter_flags = {},
	-- lint_prompt_style: qf (quickfix), vt (virtual text)
	lint_prompt_style = 'qf',
	-- formatter: goimports, gofmt, gofumpt, lsp
	formatter = 'goimports',
	-- maintain cursor position after formatting loaded buffer
	maintain_cursor_pos = false,
	-- test flags: -count=1 will disable cache
	test_flags = { '-v' },
	test_timeout = '30s',
	test_env = {},
	-- show test result with popup window
	test_popup = true,
	test_popup_auto_leave = false,
	test_popup_width = 80,
	test_popup_height = 10,
	-- test open
	test_open_cmd = 'edit',
	-- struct tags
	tags_name = 'json',
	tags_options = { 'json=omitempty' },
	tags_transform = 'snakecase',
	tags_flags = { '-skip-unexported' },
	-- quick type
	quick_type_flags = { '--just-types' },
})

lspconfig.gopls.setup({
	capabilities = capabilities,
})

--local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
--vim.api.nvim_create_autocmd("BufWritePre", {
	--pattern = "*.go",
	--callback = function()
		--require('go.format').goimport()
	--end,
	--group = format_sync_grp,
--})

--require("go.format").gofmt()    -- gofmt only
--require("go.format").goimport() -- goimport + gofmt

---- Run gofmt on save

--vim.api.nvim_create_autocmd("BufWritePre", {
	--pattern = "*.go",
	--callback = function()
		--require('go.format').gofmt()
	--end,
	--group = format_sync_grp,
--})

---- Run gofmt + goimport on save
