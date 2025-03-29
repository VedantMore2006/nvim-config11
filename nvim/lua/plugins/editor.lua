return {
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "typescript", "c", "cpp" },
      highlight = { enable = true },
      indent = { enable = true },
    })
    end,
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
      },
      format_on_save = { timeout_ms = 500 },
    })
    end,
  },
  { "numToStr/Comment.nvim", event = "VeryLazy", config = true },
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", config = true },
  { "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim" },
    config = function()
    require("telescope").setup({
      defaults = { file_ignore_patterns = { "node_modules", ".git" }, layout_strategy = "horizontal", layout_config = { prompt_position = "top" } },
    })
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
    end,
  },
  { "folke/trouble.nvim",
    cmd = { "TroubleToggle" },
    config = function() require("trouble").setup({}) end,
  },
  { "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle" },
    config = function() require("nvim-tree").setup({}) end,
  },
}
