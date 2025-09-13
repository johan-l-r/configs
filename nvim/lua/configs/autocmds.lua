vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true }), 

	callback = function()
		if vim.fn.mode() == "n" then
			vim.opt.hlsearch = false
		end
	end,
})
