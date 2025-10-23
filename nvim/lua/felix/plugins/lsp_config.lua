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

vim.lsp.enable("lua_ls")
vim.lsp.enable("solargraph")
vim.lsp.enable("ts_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("rubocop")
vim.lsp.enable("eslint")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("ust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      procMacro = { enable = true },
    },
  },
})
