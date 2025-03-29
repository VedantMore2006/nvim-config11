-- plugins/tools.lua
return {
  { "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
    require("which-key").setup({
      win = { border = "single" },
      layout = { align = "center" },
    })
    require("which-key").register({
      ["<leader>f"] = { name = "Find/Files" },
      ["<leader>b"] = { name = "Buffers" },
    })
    end,
  },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "williamboman/mason.nvim", -- Add Mason for :Mason command
    cmd = { "Mason" },
    config = function()
    require("mason").setup({
      ui = { border = "rounded" },
    })
    end,
  },
}
