local M = {}

local default_config = {
	fat_vert_split = false,
	colored_columns = false,
	light = false,
	colors = {
		none = "NONE",
		black = "#000000",
		white = "#FFFFFF",

    blue_light = "#69B3DD",
    blue_medium = "#0000FF",
    blue_dark = "#033A6D",

    green_light = "#A8D52B",
    green_medium = "#59A83E",
    green_dark = "#406932",

    magenta_light = "#F57796",
    magenta_medium = "#C92778",
    magenta_dark = "#7A264E",

    cyan_light = "#00B594",
    cyan_medium = "#077264",
    cyan_dark = "#045348",

    yellow_medium = "#F88F24",
    yellow_dark = "#D76C00",
    yellow_light = "#FFC427",

    red_light = "#EE560D",
    red_medium = "#B93B00",
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

local function set_config_bg()
	-- TODO: there should be another more direct way to reach the background variable
	if vim.opt.background._value == "light" then
		_G.cabin_cnf = vim.tbl_deep_extend("force", _G.cabin_cnf, { light = true })
  else
		_G.cabin_cnf = vim.tbl_deep_extend("force", _G.cabin_cnf, { light = false })
  end
end


local function apply_theme()
  local sections = require("cabin.theme").setup(_G.cabin_cnf)
	for _, section in pairs(sections) do
		for _, group in ipairs(section) do
			local highlight_command = require("cabin.utils").stringify_group(group)
			vim.cmd(highlight_command)
		end
	end
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

  set_config_bg()
  apply_theme()

	local group = vim.api.nvim_create_augroup("CABIN", {})
	vim.api.nvim_create_autocmd({ "OptionSet" }, {
		group = group,
		pattern = "background",
		callback = function()
      set_config_bg()
      apply_theme()
		end,
	})
end

return M
