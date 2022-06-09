local M = {}

local newColors = {
black = "#000000",
white = "#FFFFFF",
blue_medium = "#4F87E5",
blue_light = "#00B5F4",
blue_dark = "#375A7E",
green_medium = "#59A83E",
green_light = "#A8D52B",
green_dark = "#406932",
magenta_medium = "#C92778",
magenta_light = "#F57796",
magenta_dark = "#7A264E",
cyan_medium = "#00B594",
cyan_light = "#81DFC6",
cyan_dark = "#077264",
yellow_medium = "#FFC427",
yellow_light = "#FAE050",
yellow_dark = "#AA7A00",
red_medium = "#EE560D",
red_light = "#F88F24",
red_dark = "#913408",
shade_dark1 = "#211D18",
shade_dark2 = "#2B2721",
shade_dark3 = "#403B31",
shade_dark4 = "#50493E",
shade_dark5 = "#595446",
shade_dark6 = "#726A5A",
shade_dark7 = "#8E8371",
shade_dark8 = "#9D9484",
shade_light1 = "#EFEDE5",
shade_light2 = "#E9E5D7",
shade_light3 = "#D9CEB7",
shade_light4 = "#CEC0A2",
shade_light5 = "#C8B897",
shade_light6 = "#C1AF89",
shade_light7 = "#B7A785",
shade_light8 = "#AD9F7E",

}

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

  -- Destroy global config (we might not want to do this as it disables the
  -- ability to change colorschemes with :colorscheme, we need the global
  -- setup)
	-- _G.cabin_cnf = nil
end

return M
