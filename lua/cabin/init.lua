local config = require("cabin.config")
local utils = require("cabin.utils")
local theme = require("cabin.theme")
local M = {}

-- HiGroup {
--   name: String,
--   link?: String (GroupName)
--   fg: String (HEX)
--   bg: String (HEX)
--   style: String (Bold,Italics,Reverse)
-- }

M.colorscheme = function()
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

	local sections = theme.setup(config)
	for _, section in pairs(sections) do
		for _, group in ipairs(section) do
			local highlight_command = utils.stringify_group(group)
			vim.cmd(highlight_command)
		end
	end
end

M.setup = function(options)
  config.set_options(options)
end

return M
