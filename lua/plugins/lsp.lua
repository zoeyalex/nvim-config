return {
    {
        'neovim/nvim-lspconfig', -- Core LSP plugin
        config = function()
            -- Reserve space in the gutter to prevent layout shifts
            vim.opt.signcolumn = 'yes'

            -- Add cmp_nvim_lsp capabilities to LSP settings
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
            )

            -- Require and prep lsp_signature
            local lsp_signature = require('lsp_signature')
            local lsp_signature_cfg = {
                bind = true,
                floating_window = true,
                floating_window_above_cur_line = true,
                hint_enable = true,
                handler_opts = {
                    border = "single",
                },
                always_trigger = true,
                toggle_key = '<M-x>',
            }

            -- Define shared on attach
            local on_attach = function(client, bufnr)
                lsp_signature.on_attach(lsp_signature_cfg, bufnr)

                -- Define LSP-related key mappings
                local opts = { buffer = bufnr }
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end

            -- LSP Server Configuration
            local lspconfig = require('lspconfig')

            -- Python LSP (pyright)
            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })

            -- C/C++ LSP (clangd)
            lspconfig.clangd.setup({
                cmd = { "clangd", "--background-index" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
            })
        end,
    },
    {
        'hrsh7th/nvim-cmp', -- Autocompletion plugin
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
            })
        end,
    },
}
