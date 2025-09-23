local fzf = require("fzf-lua")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspConfig", {}), 

  callback = function()
    function set_km(keys, action, desc, mode)
      -- set default values to function arguments
      desc = desc or ""
      mode = mode or "n"

      vim.keymap.set(mode, keys, action, { desc = desc })
    end
  end,

  set_km("<leader>ca", fzf.lsp_code_actions, "display code actions"), 
  set_km("<leader>d", function() vim.diagnostic.open_float() end, "show diagnostic")
})
