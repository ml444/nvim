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

