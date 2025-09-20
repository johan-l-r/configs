return {
  cmd = { "pyright-langserver", "--stdio" },

  filetypes = { "python" }, 

  root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }, { upward = true })[1]),

  capabilities = require("blink.cmp").get_lsp_capabilities(),

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
}
