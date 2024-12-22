return
{
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
        bind = true,
        floating_window = true,
        floating_window_above_cur_line = true,
        hint_enable = true,
        handler_opts = {
            border = "single"
        },
        always_trigger = true,
        toggle_key = '<M-x>',
    },
    config = function(_, opts)
        require'lsp_signature'.setup(opts)
    end,
}
