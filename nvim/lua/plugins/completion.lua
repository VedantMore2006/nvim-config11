return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "uga-rosa/cmp-dictionary",
      "onsails/lspkind.nvim",
    },
    config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Snippets for braces and quotes
    luasnip.add_snippets("all", {
      luasnip.snippet("'", { luasnip.text_node("''"), luasnip.insert_node(1) }),
                         luasnip.snippet('"', { luasnip.text_node('""'), luasnip.insert_node(1) }),
                         luasnip.snippet("(", { luasnip.text_node("()"), luasnip.insert_node(1) }),
                         luasnip.snippet("[", { luasnip.text_node("[]"), luasnip.insert_node(1) }),
                         luasnip.snippet("{", { luasnip.text_node("{}"), luasnip.insert_node(1) }),
    })

    cmp.setup({
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      window = {
        completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expandable() then
          luasnip.expand()
          elseif cmp.visible() then
            cmp.confirm({ select = true })
            else
              fallback()
              end
              end, { "i", "s" }),
              ["<Down>"] = cmp.mapping.select_next_item(),
                                          ["<Up>"] = cmp.mapping.select_prev_item(),
                                          ["<C-Space>"] = cmp.mapping.complete(),
                                          ["<C-e>"] = cmp.mapping.abort(),
                                          ["<Esc>"] = cmp.mapping(function(fallback)
                                          if cmp.visible() then cmp.abort() else fallback() end
                                            end, { "i" }),
                                            ["<C-n>"] = cmp.mapping(function(fallback)
                                            if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end
                                              end, { "i", "s" }),
                                              ["<C-p>"] = cmp.mapping(function(fallback)
                                              if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end
                                                end, { "i", "s" }),
      }),
      sources = {
        { name = "dictionary", keyword_length = 1, priority = 1000 },
        { name = "luasnip", priority = 750 },
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          menu = { dictionary = "[Dict]", luasnip = "[Snippet]" },
        }),
      },
      experimental = { ghost_text = true },
    })

    -- Configure dictionary
    require("cmp_dictionary").setup({
      paths = { vim.fn.stdpath("config") .. "/dictionary.txt" },
                                    exact_length = 2,
                                    first_case_insensitive = true,
    })

    -- Enable command-line completion for ':'
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
                      sources = cmp.config.sources({
                        { name = "cmdline" },
                      }),
    })

    -- Optional: Keep search completion disabled if not needed
    cmp.setup.cmdline({ "/", "?" }, { sources = {} })
    end,
  },
}
