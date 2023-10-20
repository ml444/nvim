require('go').setup({
    lsp_cfg = true,     -- 启用LSP配置
})

-- 重新加载新import依赖命令:LspRestart

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })      --:call GoDef()<CR>
vim.api.nvim_set_keymap('n', 'gf', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })      --:call GoDecl()<CR>   查看函数声明或实现的位置
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })          --:call GoRef()<CR>     查看类型或函数的所有引用
-- vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.clear_references()<CR>', { noremap = true, silent = true })          --Removes document highlights from current buffer.
vim.api.nvim_set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })      --:call GoTypeDef()<CR>    跳转到类型定义
vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = false })      --
-- vim.api.nvim_set_keymap('n', '<Leader>[', ':lua vim.lsp.util.jump_back()<CR>', { noremap = true, silent = true })      --:call GoBack()<CR>
-- vim.api.nvim_set_keymap('n', '<Leader>]', ':lua vim.lsp.util.jump_forward()<CR>', { noremap = true, silent = true })      --:call GoForward()<CR>


vim.api.nvim_set_keymap('n', '<Leader>r', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = false })      --
vim.api.nvim_set_keymap('n', '<C-l>', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = false})      --
vim.api.nvim_set_keymap('n', '<Tab>', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = false })      --
vim.api.nvim_set_keymap('n', '<C-[>', ':lua vim.lsp.buf.incoming_calls()<CR>', { noremap = true, silent = false })      --
vim.api.nvim_set_keymap('n', '<C-]>', ':lua vim.lsp.buf.outgoing_calls()<CR>', { noremap = true, silent = false })      --
