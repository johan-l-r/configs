return {
	"nvim-treesitter/nvim-treesitter", 
	branch = "master", 
	lazy = false, 
	build = ":TSUpdate", 

	config = function()
		require'nvim-treesitter.configs'.setup({
			ensure_installed = { "c", "lua", "python", "javascript", "markdown" },
			auto_install = true,
			highlight = { enable = true }, 

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<C-space>",
				},
			}
		})
	end
}
