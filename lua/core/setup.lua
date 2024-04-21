local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    -- 主题
    "folke/tokyonight.nvim", -- 主题
    -- { "catppuccin/nvim", lazy = true, name = "catppuccin", priority = 1000 },  -- 主题: https://github.com/catppuccin/nvim

    "nvim-lualine/lualine.nvim",       -- 状态栏
    "nvim-tree/nvim-tree.lua",         -- 文档树
    "nvim-tree/nvim-web-devicons",     -- 文档树图标

    "christoomey/vim-tmux-navigator",  -- 用ctl-hjkl来定位窗口
    "nvim-treesitter/nvim-treesitter", -- 语法高亮
    "p00f/nvim-ts-rainbow",            -- 配合treesitter，不同括号颜色区分

    -- {
    --     "williamboman/mason.nvim",
    --     "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
    --     "neovim/nvim-lspconfig"
    -- },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        -- config = function()
        --     local capabilities = vim.lsp.protocol.make_client_capabilities()
        --     capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        --
        --     require('mason').setup()
        --     local mason_lspconfig = require 'mason-lspconfig'
        --     mason_lspconfig.setup {
        --         ensure_installed = { "pyright" }
        --     }
        --     require("lspconfig").pyright.setup {
        --         capabilities = capabilities,
        --     }
        -- end
    },

    -- "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        config = function()
            require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
        end
    },
    -- 自动补全
    -- "hrsh7th/nvim-cmp",
    -- "hrsh7th/cmp-nvim-lsp",
    -- "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        -- config = function()
        --     local has_words_before = function()
        --         unpack = unpack or table.unpack
        --         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --         return col ~= 0 and
        --         vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        --     end
        --
        --     local cmp = require('cmp')
        --     local luasnip = require('luasnip')
        --
        --     cmp.setup({
        --         snippet = {
        --             expand = function(args)
        --                 luasnip.lsp_expand(args.body)
        --             end
        --         },
        --         completion = {
        --             autocomplete = false
        --         },
        --         mapping = cmp.mapping.preset.insert({
        --             ["<Tab>"] = cmp.mapping(function(fallback)
        --                 if cmp.visible() then
        --                     cmp.select_next_item()
        --                 elseif luasnip.expand_or_jumpable() then
        --                     luasnip.expand_or_jump()
        --                 elseif has_words_before() then
        --                     cmp.complete()
        --                 else
        --                     fallback()
        --                 end
        --             end, { "i", "s" }),
        --             ["<s-Tab>"] = cmp.mapping(function(fallback)
        --                 if cmp.visible() then
        --                     cmp.select_prev_item()
        --                 elseif luasnip.jumpable(-1) then
        --                     luasnip.jump(-1)
        --                 else
        --                     fallback()
        --                 end
        --             end, { "i", "s" }),
        --             ["<c-e>"] = cmp.mapping.abort(),
        --             ["<CR>"] = cmp.mapping.confirm({ select = true }),
        --         }),
        --         sources = {
        --             { name = "nvim_lsp" },
        --             { name = "luasnip" },
        --         }
        --     })
        -- end
    },

    "hrsh7th/cmp-path",      -- 文件路径
    { "folke/neodev.nvim", opts = {} },

    "numToStr/Comment.nvim", -- gcc和gc注释
    "windwp/nvim-autopairs", -- 自动补全括号

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- buffer 标签页
    "lewis6991/gitsigns.nvim",    -- 左则git提示
    {
        "FabijanZulj/blame.nvim", -- 侧边窗口展示git blame
        "f-person/git-blame.nvim" -- 跟随光标提示git blame
    },
    -- AI
    "zhenyangze/vim-bitoai",
    { 'codota/tabnine-nvim',     build = "./dl_binaries.sh" },

    -- {
    --     'nvim-telescope/telescope.nvim',
    --     tag = '0.1.2',                                 -- 文件检索
    --     dependencies = { { 'nvim-lua/plenary.nvim' } } -- requires要改为dependencies
    -- },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        -- keys = {
        --     { "<leader>sf",      "<cmd>Telescope git_files<cr>",                     desc = "Find Files (root dir)" },
        --     { "<leader><space>", "<cmd>Telescope buffers<cr>",                       desc = "Find Buffers" },
        --     { "<leader>sg",      "<cmd>Telescope live_grep<cr>",                     desc = "Search Project" },
        --     { "<leader>ss",      "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Search Document Symbols" },
        --     { "<leader>sw",      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search Workspace Symbols" },
        -- },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case"
                }
            }
        }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require('telescope').load_extension('fzf')
        end
    },

    { 'akinsho/toggleterm.nvim', version = "*",             config = true },

    {
        'goolord/alpha-nvim',
        -- dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    -- TODOList
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    -- 快速更改分隔符:h nvim-surround.usage
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- golang
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            -- "mfussenegger/nvim-dap",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },

}
local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
