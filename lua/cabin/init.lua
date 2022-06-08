local M = {}

local default_config = {
	fat_vert_split = false,
	colored_columns = true,
	fear_of_the_dark = false,
	light = false,
	colors = {
		none = "NONE",
		black = "#000000",
		grey0 = "#171512",
		grey1 = "#1E1B17",
		grey2 = "#26231E",
		grey3 = "#38342B",
		grey4 = "#464036",
		grey5 = "#4F4A3D",
		grey6 = "#675F4F",
		grey7 = "#837865",
		grey8 = "#B9A57D",
		grey9 = "#D3C7AE",
		grey10 = "#E6E1D1",
		white = "#FFFFFF",
		red = "#E94C09",
		bright_red = "#F5841B",
		green = "#529E32",
		bright_green = "#A0CF19",
		yellow = "#FDBC18",
		bright_yellow = "#F8DB40",
		blue = "#477CE3",
		bright_blue = "#05ACF4",
		cyan = "#18AC88",
		bright_cyan = "#79DBBE",
		magenta = "#BF236E",
		bright_magenta = "#F16C8C",
	},
}

function M.setup(overrides)
	-- Load global config
	_G.cabin_cnf = vim.deepcopy(default_config)

	-- Modify global config
	_G.cabin_cnf = vim.tbl_deep_extend("force", _G.cabin_cnf, overrides)
end

function M.load()
	-- clear if not colorscheme default
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	-- Reset the colors, they might have been messed up
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	if not vim.o.termguicolors then
		print("Turning on option 'termguicolors'")
		vim.o.termguicolors = true
	end

	vim.g.colors_name = "cabin"

	local sections = require("cabin.theme").setup(_G.cabin_cnf)
	for _, section in pairs(sections) do
		for _, group in ipairs(section) do
			local highlight_command = require("cabin.utils").stringify_group(group)
			vim.cmd(highlight_command)
		end
	end

	-- Destroy global config
	_G.cabin_cnf = nil
end

return M
