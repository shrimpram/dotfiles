return {
	"lewis6991/gitsigns.nvim",
	version = "1.0.1",
	event = "VeryLazy",
	config = function()
		require("shreeram.conf.gitsigns")
	end,
}
