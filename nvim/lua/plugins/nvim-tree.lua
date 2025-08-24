return {
	"nvim-tree/nvim-tree.lua", 
	
	dependencies = "nvim-tree/nvim-web-devicons", 

	config = function()
		local gheight = vim.api.nvim_list_uis()[1].height
		local gwidth = vim.api.nvim_list_uis()[1].width
		local width = 100
		local height = 30

		local km = vim.keymap

		require("nvim-tree").setup({
			view = {
				width = 25, 
				float = {
					enable = true, 

					open_win_config = {
						width = width,
						height = height,
						row = (gheight - height) * 0.5,
						col = (gwidth - width) * 0.5,
					}
				}
			},
			renderer = {
				indent_markers = { enable = true }
			}, 
			diagnostics = {
				enable = true,
        show_on_dirs = true
			}, 
			modified = { enable = true }
		})

		km.set(
			{ "n", "x"}, 
			"<leader>eo", 
			"<cmd>NvimTreeToggle<cr>", 
			{ desc = "open file explorer" }
		)
	end
}
