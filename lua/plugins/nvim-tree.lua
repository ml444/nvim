-- 默认不开启nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  auto_close = true,    -- 关闭文件时自动关闭
  sort_by = "case_sensitive",
  view = {
    width = 30,
    -- number = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    -- dotfiles = true,
  },
})

