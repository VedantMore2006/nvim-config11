-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings
local general = augroup("General", { clear = true })
autocmd("TextYankPost", {
    group = general,
    callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})



autocmd("VimResized", {
    group = general,
    callback = function()
    vim.cmd("tabdo wincmd =")
    end,
})
autocmd({"BufWinLeave"}, { group = general, pattern = "*.*", command = "mkview" })
autocmd({"BufWinEnter"}, { group = general, pattern = "*.*", command = "silent! loadview" })

-- Language-specific indentation
local languages = augroup("Languages", { clear = true })
autocmd("FileType", {
    group = languages,
    pattern = { "html", "css", "javascript", "typescript", "json", "yaml" },
    callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    end,
})
autocmd("FileType", {
    group = languages,
    pattern = { "python", "rust", "go" },
    callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    end,
})
