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
        "bashls",
        "jdtls",
        "clangd",
        "cmake",
        "pyright",
        -- "golangci-lint",
        -- "golangci-lint-langserver",
        -- "json-lsp",
        -- "buf",
        -- "cmakelang",
        -- "cmakelint",
        -- "gotests",
        -- "json-to-struct",
        -- "pulint",
        -- "yaml-language-server",
        -- "yamlfmt",
        -- "sqlfmt",
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

require('lspconfig').bufls.setup {
    cmd = { "bufls", "serve" },
    filetypes = { "proto" },
}

require('lspconfig').pyright.setup{
    capabilities = capabilities,
}

-- require("mason-lspconfig").setup_handlers({
--   function (server_name)
--     require("lspconfig")[server_name].setup{}
--   end,
--   -- Next, you can provide targeted overrides for specific servers.
--   ["lua_ls"] = function ()
--     lspconfig.lua_ls.setup {
--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { "vim" }
--           }
--         }
--     }
--   }
--   end,
--   ["clangd"] = function ()
--     lspconfig.clangd.setup {
--       cmd = {
--         "clangd",
--         "--header-insertion=never",
--         "--query-driver=/opt/homebrew/opt/llvm/bin/clang",
--         "--all-scopes-completion",
--         "--completion-style=detailed",
--       }
--     }
--   end
-- })
