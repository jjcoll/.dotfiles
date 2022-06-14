-- Enable autocompletion 
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Python server
require'lspconfig'.pyright.setup{}

-- Html server
require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- Css Server
require'lspconfig'.cssls.setup{
  capabilities = capabilities,
}
-- require'lspconfig'.cssmodules_ls.setup{}

-- JS -- VStudio Codes eslint language server
require'lspconfig'.eslint.setup{}

-- Typescript
require'lspconfig'.tsserver.setup{}

-- Lua 
require'lspconfig'.sumneko_lua.setup{}

-- LSP installer 
require("nvim-lsp-installer").setup{}

-- Markdown
require'lspconfig'.marksman.setup{}
