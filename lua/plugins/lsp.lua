require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "gopls",
    "bufls",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").gopls.setup {
  settings = {
    gopls = {
      usePlaceholders = true,
    },
  },
}
require('lspconfig').bufls.setup {
    -- cmd={ "bufls", "serve" },
    -- filetypes={"proto"},
}


