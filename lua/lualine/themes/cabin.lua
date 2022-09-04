local cs = require('cabin.colors')
local config = _G.cabin_cnf
local cabin = {}

cabin.normal = {
	a = { bg = cs.white, fg = cs.black, gui = "bold" },
	b = { bg = cs.white, fg = cs.black },
	c = { bg = cs.white, fg = cs.black },
}

cabin.insert = {
	a = { bg = cs.white, fg = cs.black, gui = "bold" },
	b = { bg = cs.white, fg = cs.black },
}

cabin.command = {
	a = { bg = cs.white, fg = cs.black, gui = "bold" },
	b = { bg = cs.white, fg = cs.black },
}

cabin.visual = {
	a = { bg = cs.white, fg = cs.black, gui = "bold" },
	b = { bg = cs.white, fg = cs.black },
}

cabin.replace = {
	a = { bg = cs.white, fg = cs.black, gui = "bold" },
	b = { bg = cs.white, fg = cs.black },
}

cabin.inactive = {
	a = { bg = cs.white, fg = cs.black },
	b = { bg = cs.white, fg = cs.black, gui = "bold" },
	c = { bg = cs.white, fg = cs.black },
}

return cabin

