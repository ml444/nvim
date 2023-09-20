require('indent_blankline').setup({
  char = '▏',                               --将出现在屏幕上的字符
  show_trailing_blankline_indent = false,   --空行中显示缩进指南
  show_first_indent_level = false,          --在第一列显示缩进指南
  use_treesitter = true,                    --使用 treesitter 确定缩进指南的位置
  show_current_context = false              --突出显示光标所在的缩进级别
})
