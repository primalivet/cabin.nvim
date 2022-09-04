local M = {}

local colors = require('cabin.colors')
local default_config = {
	fat_vert_split = false,
	colored_columns = false,
  dimmed_statusline = true,
  dimmed_linenr = true,
	light = false,
	colors = colors,
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
