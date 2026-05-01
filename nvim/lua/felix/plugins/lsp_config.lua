require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "solargraph",
    "ts_ls",
    "tailwindcss",
    "rust_analyzer",
    "rubocop",
    "gopls",
    "pyright",
    "kotlin_lsp"
  }
})

vim.lsp.enable("kotlin_lsp")
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("solargraph")
vim.lsp.enable("ts_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("rubocop")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      procMacro = { enable = true },
    },
  },
})

local XCODE_DEV = '/Applications/Xcode.app/Contents/Developer'
local XCODE_TC  = XCODE_DEV .. '/Toolchains/XcodeDefault.xctoolchain'

local cmp_caps  = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('sourcekit', {
  cmd                 = { XCODE_TC .. '/usr/bin/sourcekit-lsp' }, -- Xcode toolchain override
  filetypes           = { 'swift' },
  single_file_support = true,
  offset_encoding     = 'utf-16',
  capabilities        = vim.tbl_deep_extend('force', cmp_caps, {
    general   = { positionEncodings = { 'utf-16' } },
    workspace = { didChangeWatchedFiles = { dynamicRegistration = true } },
  }),
})

vim.lsp.enable('sourcekit')
