local cs = require("cabin.colors")

local cabin = {
	normal = {
		a = { bg = cs.elevation.up3, fg = cs.yellow, gui = "bold" },
		b = { bg = cs.elevation.up2, fg = cs.fg },
		c = { bg = cs.elevation.up1, fg = cs.fg },
	},
	insert = {
		a = { bg = cs.elevation.up2, fg = cs.green, gui = "bold" },
		b = { bg = cs.elevation.up2, fg = cs.fg },
		c = { bg = cs.elevation.up1, fg = cs.fg },
	},
	visual = {
		a = { bg = cs.elevation.up3, fg = cs.cyan, gui = "bold" },
		b = { bg = cs.elevation.up2, fg = cs.fg },
		c = { bg = cs.elevation.up1, fg = cs.fg },
	},
	replace = {
		a = { bg = cs.elevation.up3, fg = cs.fg, gui = "bold" },
		b = { bg = cs.elevation.up2, fg = cs.fg },
		c = { bg = cs.elevation.up1, fg = cs.fg },
	},
	command = {
		a = { bg = cs.elevation.up3, fg = cs.fg, gui = "bold" },
		b = { bg = cs.elevation.up2, fg = cs.fg },
		c = { bg = cs.elevation.up1, fg = cs.fg },
	},
	inactive = {
		a = { bg = cs.elevation.up1, fg = cs.fg, gui = "bold" },
		b = { bg = cs.elevation.up1, fg = cs.fg },
		c = { bg = cs.elevation.up1, fg = cs.fg },
	},
}

return cabin
