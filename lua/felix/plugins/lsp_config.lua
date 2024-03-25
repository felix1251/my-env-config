require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "solargraph",
    "tsserver",
    "tailwindcss",
    "rust_analyzer"
  }
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = { { "class: ?\"([^\"]*)\"", "([a-zA-Z0-9\\-:]+)" }, { "(\\.[\\w\\-.]+)[\\n\\=\\{\\s]", "([\\w\\-]+)" } }
      }
    }
  }
})

lspconfig.solargraph.setup({})
lspconfig.tsserver.setup({})
lspconfig.gopls.setup({})
