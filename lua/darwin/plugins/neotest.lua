return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"V13Axel/neotest-pest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-pest"),
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>tn", function()
			require("neotest").run.run()
		end, { desc = "Run the nearest test" })
		keymap.set("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Run the current test file" })
		keymap.set("n", "<leader>td", function()
			require("neotest").run.run(vim.uv.cwd())
		end, { desc = "Run all tests inside the current working directory (Neotest)" })
	end,
}
