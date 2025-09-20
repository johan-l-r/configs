return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" }, 

  capabilities = require("blink.cmp").get_lsp_capabilities(),

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", 
      },
      diagnostics = {
        globals = { "vim" }, -- recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}
