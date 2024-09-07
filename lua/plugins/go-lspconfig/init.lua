local lspconfig = require('lspconfig')

--function CaptureAndNotify()
--local output = vim.fn.system('runhaskell main.hs')
--vim.notify(output, vim.log.levels.INFO)
--end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local M = {}
function M.setup()
  lspconfig.gopls.setup({
    on_attach = function(client, buffer)
      --vim.opt.tabstop = 2
      --vim.opt.shiftwidth = 2
      --vim.opt.expandtab = true
      if client.server_capabilities.documentFormattingProvider then
        -- Map <leader>f to the formatting command
        vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>fl', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',
          { noremap = true, silent = true })
      end
      --vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>',
        --{ noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true })
      --vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>t', ':! runhaskell % | cat<CR>',
    end
    ,
    capabilities = capabilities,
  })
end

return M
