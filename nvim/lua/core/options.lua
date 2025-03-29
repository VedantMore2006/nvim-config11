-- Vim options and settings
vim.opt.termguicolors = true         -- Enable true colors
vim.opt.syntax = "on"                -- Syntax highlighting

-- UI settings
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.cursorline = true            -- Highlight current line
vim.opt.cursorlineopt = "number"     -- Highlight line number only
vim.opt.scrolloff = 10               -- Keep 10 lines visible
vim.opt.signcolumn = "yes"           -- Always show sign column
vim.opt.splitbelow = true            -- New splits below
vim.opt.splitright = true            -- New vertical splits right

-- Indentation
vim.opt.tabstop = 2                  -- 2 spaces per tab
vim.opt.shiftwidth = 2               -- 2 spaces for indent
vim.opt.expandtab = true             -- Tabs to spaces
vim.opt.smartindent = true           -- Smart indentation

-- Mouse and scrolling
vim.opt.mouse = "a"                  -- Enable mouse
vim.opt.smoothscroll = true          -- Smooth scrolling

-- Clipboard
vim.opt.clipboard = "unnamedplus"    -- Use system clipboard

-- Search
vim.opt.ignorecase = true            -- Case-insensitive search
vim.opt.smartcase = true             -- Case-sensitive if uppercase

-- Performance
vim.opt.lazyredraw = true            -- Don't redraw during macros
vim.opt.updatetime = 250             -- Faster updates

-- Leader keys
vim.g.mapleader = " "                -- Space as leader
vim.g.maplocalleader = ","           -- Comma as local leader
-- Set Python provider
vim.g.python3_host_prog = "/usr/bin/python3"

-- Disable unnecessary built-ins
local disabled = { "gzip", "matchit", "matchparen", "tarPlugin", "tohtml", "zipPlugin", "netrwPlugin", "tutor" }
for _, plugin in pairs(disabled) do
  vim.g["loaded_" .. plugin] = 1
  end
