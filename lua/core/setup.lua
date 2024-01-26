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
    "folke/tokyonight.nvim",           -- 主题
    "nvim-lualine/lualine.nvim",       -- 状态栏
    "nvim-tree/nvim-tree.lua",         -- 文档树
    "nvim-tree/nvim-web-devicons",     -- 文档树图标

    "christoomey/vim-tmux-navigator",  -- 用ctl-hjkl来定位窗口
    "nvim-treesitter/nvim-treesitter", -- 语法高亮
    "p00f/nvim-ts-rainbow",            -- 配合treesitter，不同括号颜色区分

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    },

    -- 自动补全
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path",        -- 文件路径

    "numToStr/Comment.nvim",   -- gcc和gc注释
    "windwp/nvim-autopairs",   -- 自动补全括号

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- buffer 标签页
    "lewis6991/gitsigns.nvim", -- 左则git提示
    {
        "FabijanZulj/blame.nvim",  -- 侧边窗口展示git blame
        "f-person/git-blame.nvim"   -- 跟随光标提示git blame
    },
    -- AI 
    "zhenyangze/vim-bitoai",
    { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',                                 -- 文件检索
        dependencies = { { 'nvim-lua/plenary.nvim' } } -- requires要改为dependencies
    },

    { 'akinsho/toggleterm.nvim', version = "*", config = true },

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
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
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
