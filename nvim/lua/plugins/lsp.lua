return {
  "neovim/nvim-lspconfig", 

  dependencies = { "saghen/blink.cmp" }, 

  config = function()
    local servers = { "lua_ls", "pyright", "cssls" }

    local lspconf = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspConfig", {}), 

      callback = function(event)
        local opts = { buffer = event.buf, silent = true }

        local map = function(mode, keys, action, desc)
          vim.keymap.set(mode, keys, action, { desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "gr", vim.lsp.buf.references, "Go to References")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>d", vim.diagnostic.open_float, "Prev Diagnostic")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
      end
    })

    for _, server in ipairs(servers) do 
      local opts = {
        capabilities = capabilities
      }

      if server == "lua_ls" then
        opts.settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Neovim’s Lua runtime
            },
            diagnostics = {
              globals = { "vim" }, -- Recognize the `vim` global
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        } 
      end

      lspconf[server].setup(opts)
    end
  end
}
