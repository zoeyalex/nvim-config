return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript"}, -- Add languages here
            sync_install = false, -- Install parsers asynchronously
            auto_install = true, -- Automatically install missing parsers when opening a file

            highlight = {
                enable = true, -- Enable Tree-sitter-based highlighting
                additional_vim_regex_highlighting = false, -- Use traditional regex-based highlighting if set to true
            },
        })
    end,
}
