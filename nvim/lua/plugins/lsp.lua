-- plugins/lsp.lua
-- LSP configuration

return {
    -- LSP Support
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        }
    },

    -- LSP installer
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            -- Install packages in a separate directory
            install_root_dir = vim.fn.stdpath("data") .. "/mason",
                               PATH = "prepend", -- Prepend to PATH
        })
        end
    },

    -- Mason LSP config to automatically set up servers
    {
        "williamboman/mason-lspconfig.nvim",
        event = "BufReadPre",
        config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls",
                "html",
                "cssls",
                "jsonls",
                "clangd",

                "jdtls"
            },
         -- need to add when needed    "rust_analyzer",
            automatic_installation = true,
        })

        -- Set up all installed servers
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        -- Default handler for servers
        require("mason-lspconfig").setup_handlers({
            function(server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities,
                flags = { debounce_text_changes = 150 },
            })
            end,

            lspconfig.pyright.setup {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },

            -- Customize specific servers
            ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                   [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
            end,
        })

        -- LSP key bindings (attaches when LSP connects to buffer)
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                                    callback = function(ev)
                                    local opts = { buffer = ev.buf, noremap = true, silent = true }
                                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                                    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
                                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                                    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)
                                    end,
        })
        end
    },


    -- Set Python provider (already set, just confirming)
  --  vim.g.python3_host_prog = "/usr/bin/python3"

    -- LSP setup for Pyright



    -- (Previous LSP config unchanged until Lspsaga section)

    -- LSP UI enhancements
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
        require("lspsaga").setup({
            ui = { border = "rounded" },
            lightbulb = { enable = true },
            finder = {
                keys = {
                    vsplit = "v",
                    split = "s",
                    quit = "q",
                    edit = "o",
                    tabe = "t",
                },
            },
            definition = {
                keys = {
                    edit = "<C-c>o",
                    vsplit = "<C-c>v",
                    split = "<C-c>s",
                    tabe = "<C-c>t",
                    quit = "q",
                },
            },
            code_action = {
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
            },
        })

        -- Keymaps for Lspsaga
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }

        keymap("n", "gh", "<cmd>Lspsaga finder<CR>", opts)
        keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
        keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
        keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
        keymap("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts) -- Explicitly keep for buffer diagnostics
        keymap("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
        keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
        keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }
    },
}
