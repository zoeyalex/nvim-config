require("zzz.remap")
-- Set line nums
vim.opt.relativenumber = true
vim.opt.nu = true
-- Set Color
vim.opt.termguicolors = true
vim.cmd.colorscheme 'modus'
-- Set indentation to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 4
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
-- F9 python
local function run_python_in_venv()
    local venv_python = vim.fn.getenv("VIRTUAL_ENV") and vim.fn.getenv("VIRTUAL_ENV") .. "/bin/python" or "python3"
    vim.cmd("write") -- Save the file
    vim.cmd("split | terminal " .. venv_python .. " " .. vim.fn.shellescape(vim.fn.expand("%")))
end
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.keymap.set("n", "<F9>", run_python_in_venv, { buffer = true, desc = "Run Python in venv" })
        vim.keymap.set("i", "<F9>", function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            run_python_in_venv()
        end, { buffer = true, desc = "Run Python in venv" })
    end,
})
