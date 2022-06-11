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
