-- Enable autocompletion 
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- -- Python server
-- require'lspconfig'.pyright.setup{}
--
-- -- Html server
-- require'lspconfig'.html.setup { capabilities = capabilities,
-- }
--
-- -- Css Server
-- require'lspconfig'.cssls.setup{
--   capabilities = capabilities,
-- }
-- -- require'lspconfig'.cssmodules_ls.setup{}
--
-- -- JS -- VStudio Codes eslint language server
-- require'lspconfig'.eslint.setup{}
--
-- -- Typescript
-- require'lspconfig'.tsserver.setup{}
--
-- -- Lua
-- require 'lspconfig'.sumneko_lua.setup{
-- 	cmd = { 'lua-language-server' },
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { 'vim' }
-- 			}
-- 		}
-- 	},
-- 	on_attach = custom_attach,
-- }
--
-- -- LSP installer
-- require("nvim-lsp-installer").setup{}
--
-- -- Markdown
-- require'lspconfig'.marksman.setup{}

-- require("nvim-lsp-installer").setup({
--     automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--     }
-- }


-- First require Lsp Installer, this config is the defaul found in: https://github.com/williamboman/nvim-lsp-installer#configuration
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- This is the language server Setupt for 'lua-language-server', config default: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
