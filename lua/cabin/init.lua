local M = {}

local default_config = {
	fat_vert_split = true,
	colored_columns = true,
	fear_of_the_dark = true,
	light = false,
	colors = {
		none = "NONE",
		black = "#000000",
		white = "#FFFFFF",
		blue_medium = "#0000FF",
		blue_light = "#69B3DD",
		blue_dark = "#033A6D",
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
		shade_light1 = "#E9E5D7",
		shade_light2 = "#D9CEB7",
		shade_light3 = "#D4C9B0",
		shade_light4 = "#CEC1A5",
		shade_light5 = "#CCBD9E",
		shade_light6 = "#C5B697",
		shade_light7 = "#B9AA8C",
		shade_light8 = "#B4A687",
	},
}

function M.setup(user_settings)
	local overrides = user_settings or {}
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

	-- TODO: there should be another more direct way to reach the background variable
	if vim.opt.background._value == "light" then
		_G.cabin_cnf = vim.tbl_deep_extend("force", _G.cabin_cnf, { light = true })
	end

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
