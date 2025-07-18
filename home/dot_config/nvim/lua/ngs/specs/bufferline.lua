-- ===================================================================
--  bufferline.nvim
-- -------------------------------------------------------------------
--  https://github.com/akinsho/bufferline.nvim
--  A bufferline to display tabs
--  ui
-- -------------------------------------------------------------------
return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "TabEnter", "TabNew", "TabNewEntered" },

	opts = {
		options = {
			mode = "tabs",
			indicator = { icon = "┃" },
		},
	},
}
