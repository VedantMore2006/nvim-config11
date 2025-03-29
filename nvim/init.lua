-- Main Neovim configuration entry point

-- Load core settings
require("core")

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Setup plugins
  require("plugins")
