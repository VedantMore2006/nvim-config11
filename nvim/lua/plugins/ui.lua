-- plugins/ui.lua
-- UI-related plugins

return {
  -- Tokyo Night theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
    })

    vim.cmd("colorscheme tokyonight")

    -- Set transparent background
    vim.cmd [[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NonText guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE

      highlight Folded guibg=NONE
      highlight FloatBorder guibg=NONE
      highlight NormalFloat guibg=NONE

      highlight StatusLine  guifg=#aaaaaa
      highlight LineNr guibg=NONE
      highlight StatusLineNC guifg=#666666

    ]]
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = {
          normal = { c = { fg = "#aaaaaa", bg = "NONE" } },
          inactive = { c = { fg = "#666666", bg = "NONE" } },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 }, "diagnostics" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
    end
  },

  -- Tabs/Buffers line
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_close_icon = true,
        show_buffer_icons = true,
        always_show_bufferline = true,
      },
    })
    end
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    require("nvim-tree").setup({
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      view = {
        width = 30,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
    })
    end
  },

  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = "<C-\\>",
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })
    end
  },

  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
    require("ibl").setup({
      indent = { char = "┊" },
      scope = { enabled = true, show_start = true, show_end = true },
    })
    end
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    require("plugins.dashboard").setup()
    end
  },


  -- Distraction-free mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
    require("zen-mode").setup()
    end
  },

  -- Color highlighting
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
    require("colorizer").setup()
    end
  },
}


