
-- Set up nvim-cmp
local cmp = require'cmp'

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
        })
    })

    local lsp = require('lspconfig')
---@diagnostic disable-next-line: unused-local
    local configs = require('lspconfig/configs')
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local on_attach = function(client, bufnr)
        -- :help vim.lsp.*
        local opts = { noremap = true, silent = true }

        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>dj', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', '<leader>dk', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end

    vim.opt.completeopt={'menu', 'menuone', 'noselect'}
    require('mason').setup({
        ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗'
            }
        }
    })

    require('mason-lspconfig').setup({
        ensure_installed = { 'sumneko_lua', 'tsserver', 'tailwindcss' }
    })
    -- :h mason.lspconfig.automatic.server.setup
    require('mason-lspconfig').setup_handlers {
        function (server_name)
            require('lspconfig')[server_name].setup{on_attach=on_attach}
        end,

        ['emmet_ls'] = function ()
            lsp.emmet_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
                init_options = {
                    html = {
                        options = {
                            ['bem.enabled'] = true,
                        },
                    },
                }
            }
        end
    }
