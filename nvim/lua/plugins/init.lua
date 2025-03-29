-- plugins/init.lua
return require("lazy").setup({
    { import = "plugins.completion" },
    { import = "plugins.editor" },
    { import = "plugins.ui" },
    { import = "plugins.tools" },
    { import = "plugins.dap" },
    { import = "plugins.lsp"},
}, {
    install = { colorscheme = { "tokyonight" } }, -- Optional: Ensure theme loads
    performance = {
        rtp = {
            reset = true, -- Reset runtime path for consistency
        },
    },
})
