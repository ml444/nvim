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
        "lua",
        "gopls",
        "buf",
        "bash_ls",
        "jdtls",
        "clangd",
        "cmake",
        "pyright",
        "ts_ls",
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
    cmd = { "~/go/bin/gopls" },  -- 指定 gopls 命令
    filetypes = { "go", "gomod", "gowork", "gotmpl" },  -- 适用于 Go 相关文件
    root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            usePlaceholders = true,  -- 启用占位符
            completeUnimported = true,  -- 自动补全未导入的包
            analyses = {
                unusedparams = true,  -- 检查未使用的参数
                shadow = true,  -- 变量遮蔽检测
            },
            staticcheck = true,  -- 启用静态分析（类似 golangci-lint）
            matcher = "Fuzzy",  -- 启用模糊匹配补全
        },
    },
}

require('lspconfig').buf_ls.setup {
    cmd = { "buf", "beta", "lsp" },
    filetypes = { "proto" },
}

require('lspconfig').pyright.setup {
    capabilities = capabilities,
}

require 'lspconfig'.ts_ls.setup {}

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
