vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "<S-Enter>", "<ESC>o")

-- ======= 单行或多行移动 =======
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ==== 系统剪切板复制粘贴 ====
keymap.set("v", '<Leader>c', '"+y')  -- v 模式下复制内容到系统剪切板
keymap.set('n', '<Leader>c', '"+yy')  -- n 模式下复制一行到系统剪切板
keymap.set('n', '<Leader>v', '"+p')   -- n 模式下粘贴系统剪切板的内容

-- ========== 窗口 ========== 
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

keymap.set('n', '<Leader><Tab>', '<C-W>w')      -- 切换下个窗口
keymap.set('i', '<Leader><Tab>', '<C-O><C-W>w') -- 切换下个窗口
keymap.set('n', '<S-Tab>', '<C-W>W')            -- 切换上个窗口
keymap.set('i', '<S-Tab>', '<C-O><C-W>W')       -- 切换上个窗口


-- 取消高亮 
keymap.set("n", "<leader>h", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<leader>]", ":bnext<CR>")
keymap.set("n", "<leader>[", ":bprevious<CR>")

-- =========== 插件 =========== 
-- nvim-tree
keymap.set("n", "<F6>", ":NvimTreeToggle<CR>")

keymap.set('n', '<leader>0', '<CMD>tablast<CR>')
keymap.set('n', '<leader>dd', ':%bdelete<CR>')

-- keymap.set("n", "<leader>t", ":terminal<CR>i")

-- =========== LSP ===========
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })      --:call GoDef()<CR>
vim.api.nvim_set_keymap('n', 'gs', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })      --:call GoDecl()<CR>   查看函数声明或实现的位置
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })          --:call GoRef()<CR>     查看类型或函数的所有引用
-- vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.clear_references()<CR>', { noremap = true, silent = true })          --Removes document highlights from current buffer.
vim.api.nvim_set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })      --:call GoTypeDef()<CR>    跳转到类型定义
vim.api.nvim_set_keymap('n', 'gf', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = false })      --
-- vim.api.nvim_set_keymap('n', '<Leader>[', ':lua vim.lsp.util.jump_back()<CR>', { noremap = true, silent = true })      --:call GoBack()<CR>
-- vim.api.nvim_set_keymap('n', '<Leader>]', ':lua vim.lsp.util.jump_forward()<CR>', { noremap = true, silent = true })      --:call GoForward()<CR>
vim.api.nvim_set_keymap('n', '<Leader>r', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = false })      --
vim.api.nvim_set_keymap('n', '<C-l>', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = false})      --
vim.api.nvim_set_keymap('n', '<Tab>', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = false })      --
vim.api.nvim_set_keymap('n', '<A-}>', ':lua vim.lsp.buf.incoming_calls()<CR>', { noremap = true, silent = false })      --
vim.api.nvim_set_keymap('n', '<A-{>', ':lua vim.lsp.buf.outgoing_calls()<CR>', { noremap = true, silent = false })      --

