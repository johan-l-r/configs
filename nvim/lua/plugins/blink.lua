return {
  "saghen/blink.cmp",

  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",

  opts = {
    keymap = { 
      preset = "super-tab", 

      ["<C-k>"] = { "select_prev" },
      ["<C-j>"] = { "select_next" },
    },

    appearance = {
      nerd_font_variant = "mono"
    },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "lua" },
    signature = {
      enabled = true,
      window = { border = "rounded" }
    }
  },
}
