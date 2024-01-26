vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = { {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        } },
        numbers = function(opts)
            return string.format('%s|%s', opts.ordinal, opts.raise(opts.id))
        end,
        -- show_tab_indicators = true,
        -- show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        -- show_buffer_icons = true,     -- disable filetype icons for buffers
        -- show_buffer_close_icons = true,
        -- show_close_icon = true,
        -- show_tab_indicators = true,
        -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- move_wraps_at_ends = false,
    },

}
