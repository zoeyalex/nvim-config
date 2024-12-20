require("zzz.remap")
-- Set line nums
vim.opt.relativenumber = true
-- Set Color
vim.opt.termguicolors = true
vim.cmd.colorscheme 'modus'
-- Set indentation to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4    -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart indentation
vim.opt.wrap = false -- Disable line wrapping
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
-- Set Clipboard
vim.g.clipboard = {
    name = "xclip",
    copy = {
        ["+"] = "xclip -selection clipboard",
        ["*"] = "xclip -selection primary",
    },
    paste = {
        ["+"] = "xclip -selection clipboard -o",
        ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = true,
}
-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
    end,
    desc = "Remove trailing whitespace on save",
})
