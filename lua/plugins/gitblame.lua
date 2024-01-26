
-- https://github.com/f-person/git-blame.nvim
require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = false,
}

-- https://github.com/FabijanZulj/blame.nvim
require('blame').setup({
    width = 35,
    date_format = "%Y/%m/%d %H:%M",
    virtual_style = "right_align"   -- "right_align" or "float"

})
