local builtin = require('telescope.builtin')

-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- 当前工作目录中搜索文件
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 当前工作目录的所有文件中搜索模式,环境里要安装ripgrep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})    -- 搜索打开的文件
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>') -- 搜索诊断消息。诊断可以是错误、警告或提示
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')     -- 搜索最近打开的文件
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')  -- 在当前文件中搜索模式
