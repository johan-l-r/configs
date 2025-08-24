return {
	"lewis6991/gitsigns.nvim", 

	config = function()
		local signs = require("gitsigns")

		signs.setup({
			numhl = true, 
			attach_to_untracked = true, 

			on_attach = function()
				local km = vim.keymap 

				km.set("n", "<leader>[c", function() signs.nav_hunk("next") end, { desc = "goto next hunk" })
				km.set("n", "<leader>[c", function() signs.nav_hunk("prev") end, { desc = "goto previous hunk" })
			end
		})
	end
}
