local cs = require("cabin.colors")
local cabin = {}

cabin.normal = {
	a = { bg = cs.magenta_dark, fg = cs.yellow_light, gui = "bold,italic" },
	b = { bg = cs.shade_dark3, fg = cs.shade_light3 },
	c = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	x = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	y = { bg = cs.cyan_dark, fg = cs.cyan_light },
	z = { bg = cs.cyan_medium, fg = cs.cyan_light },
}

cabin.insert = {
	a = { bg = cs.cyan_dark, fg = cs.yellow_light, gui = "bold,italic" },
	b = { bg = cs.shade_dark3, fg = cs.shade_light3 },
	c = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	x = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	y = { bg = cs.cyan_dark, fg = cs.cyan_light },
	z = { bg = cs.cyan_medium, fg = cs.cyan_light },
}

cabin.command = {
	a = { bg = cs.shade_dark1, fg = cs.yellow_light, gui = "bold,italic" },
	b = { bg = cs.shade_dark3, fg = cs.shade_light3 },
	c = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	x = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	y = { bg = cs.cyan_dark, fg = cs.cyan_light },
	z = { bg = cs.cyan_medium, fg = cs.cyan_light },
}

cabin.visual = {
	a = { bg = cs.yellow_light, fg = cs.shade_dark2, gui = "bold,italic" },
	b = { bg = cs.shade_dark3, fg = cs.shade_light3 },
	c = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	x = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	y = { bg = cs.cyan_dark, fg = cs.cyan_light },
	z = { bg = cs.cyan_medium, fg = cs.cyan_light },
}

cabin.replace = {
	a = { bg = cs.red_dark, fg = cs.yellow_light, gui = "bold,italic" },
	b = { bg = cs.shade_dark3, fg = cs.shade_light3 },
	c = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	x = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	y = { bg = cs.cyan_dark, fg = cs.cyan_light },
	z = { bg = cs.cyan_medium, fg = cs.cyan_light },
}

cabin.inactive = {
	a = { bg = cs.shade_dark2, fg = cs.shade_light3, gui = "bold,italic" },
	b = { bg = cs.shade_dark3, fg = cs.shade_light3 },
	c = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	x = { bg = cs.shade_dark2, fg = cs.shade_light8 },
	y = { bg = cs.shde_dark2, fg = cs.cyan_light8 },
	z = { bg = cs.shade_dark2, fg = cs.cyan_light8 },
}

return cabin
