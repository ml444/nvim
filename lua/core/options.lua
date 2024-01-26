local opt = vim.opt

-- timeout
opt.timeoutlen = 400

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = true -- 字符串自动换行

-- 光标行
opt.cursorline = true
opt.colorcolumn = "80"

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.incsearch = true
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true  -- 若搜索内容中有大写字母，则不再忽略大小写


-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd [[colorscheme tokyonight-moon]]

-- ============= 折叠fold ================
--[[
"za	打开/关闭当前的折叠
"zc	关闭当前打开的折叠
"zo	打开当前的折叠
"zm	折叠所有
"zM	关闭所有折叠及其嵌套的折叠
"zr	打开所有折叠
"zR	打开所有折叠及其嵌套的折叠
"zd	删除当前折叠
"zE	删除所有折叠
"zj	移动至下一个折叠
"zk	移动至上一个折叠
"zn	禁用折叠
"zN	启用折叠
--]]
opt.foldmethod = "indent" -- 代码折叠: indent|syntax
opt.foldcolumn = "0"    -- 折叠区域的宽度
opt.foldlevelstart = 99 -- 打开文件默认不折叠代码
-- setlocal foldlevel=1	-- 折叠层数


-- set paste             "设置粘贴模式
--

-- 重新打开缓冲区恢复光标位置:
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\""))
            vim.cmd("silent! foldopen")
        end
    end,
})

-- 自动保存编辑的缓冲区：
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    command = "silent! wall",
    nested = true,
})
