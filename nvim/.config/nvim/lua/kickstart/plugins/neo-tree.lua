return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			enabled = true,
		},
	},
	lazy = false,
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		renderers = {
      file = {
        { "indent" },
        { "icon" },
        { "name", use_git_status_colors = true },
        -- Ensure {"size"} is not included here
        { "git_status" },
        { "diagnostics" },
      },
    },
		enable_git_status = true,
		enable_diagnostics = true,
		filesystem = {
			window = {
				auto_expand_width = true,
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
