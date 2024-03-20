require("conform").setup({
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettierd", "prettier" } },
    ruby = { "rubocop" }
  },
})
