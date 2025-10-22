require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "solargraph",
    "ts_ls",
    "tailwindcss",
    "rust_analyzer",
    "rubocop",
    "eslint",
    "gopls"
  }
})

-- local lspconfig = require('lspconfig')
-- local lsp_defaults = lspconfig.util.default_config
--
-- lsp_defaults.capabilities = vim.tbl_deep_extend(
--   'force',
--   lsp_defaults.capabilities,
--   require('cmp_nvim_lsp').default_capabilities()
-- )
--
-- lspconfig.lua_ls.setup {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--           [vim.fn.stdpath "config" .. "/lua"] = true,
--         },
--       },
--     },
--   }
-- }

-- lspconfig.tailwindcss.setup({
--   settings = {
--     tailwindCSS = {
--       experimental = {
--         classRegex = { { "class: ?\"([^\"]*)\"", "([a-zA-Z0-9\\-:]+)" }, { "(\\.[\\w\\-.]+)[\\n\\=\\{\\s]", "([\\w\\-]+)" } }
--       }
--     }
--   }
-- })
--
-- lspconfig.rust_analyzer.setup({})
-- lspconfig.solargraph.setup({})
-- lspconfig.ts_ls.setup({})
-- lspconfig.gopls.setup({})
-- lspconfig.rubocop.setup({})
-- lspconfig.eslint.setup({})

vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      procMacro = { enable = true },
    },
  },
})
vim.lsp.enable("solargraph")
vim.lsp.enable("ts_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("rubocop")
vim.lsp.enable("eslint")
vim.lsp.enable("tailwindcss")
