require("conform").setup({
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    typescript = { 'prettierd', "prettier" },
    typescriptreact = { 'prettierd', "prettier" },
    javascript = { 'prettierd', "prettier" },
    javascriptreact = { 'prettierd', "prettier" },
    json = { 'prettierd', "prettier" },
    html = { 'prettierd', "prettier" },
    css = { 'prettierd', "prettier" },
  },
})
