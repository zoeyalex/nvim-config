return {
    "karb94/neoscroll.nvim",
    opts = {
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide the cursor while scrolling
        stop_eof = true, -- Stop at the end of the file when scrolling down
        respect_scrolloff = false, -- Stop scrolling when cursor reaches `scrolloff` margin
        cursor_scrolls_alone = true, -- Cursor continues scrolling even if window cannot
        easing = "quadratic", -- Easing function for smooth scrolling
        duration_multiplier = 1.0, -- Duration multiplier for scroll animations
    },
    config = function(_, opts)
        require("neoscroll").setup(opts)
    end,
}
