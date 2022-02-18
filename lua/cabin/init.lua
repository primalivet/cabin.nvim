local colors = require("cabin.colors")
local M = {}

local function set_vim_options()
	-- only needed to clear when not the default colorscheme
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if not vim.o.termguicolors then
		print("Turning on option 'termguicolors'")
		vim.o.termguicolors = true
	end

	vim.g.colors_name = "cabin"
end

-- HiGroup {
--   name: String,
--   link?: String (GroupName)
--   fg: String (HEX)
--   bg: String (HEX)
--   style: String (Bold,Italics,Reverse)
-- }

local function stringify_group(group)
	local name = group.name and group.name or ""
	local link = group.link and group.link or nil
	local fg = group.fg and "guifg=" .. group.fg or "guifg=NONE"
	local bg = group.bg and "guibg=" .. group.bg or "guibg=NONE"
	local sp = group.sp and "guisp=" .. group.sp or "guisp=NONE"
	local style = group.style and "gui=" .. group.style or "gui=NONE"
	return link and string.format("hi link %s %s", name, link)
		or string.format("hi %s %s %s %s %s", name, fg, bg, sp, style)
end

function M.colorscheme()
	set_vim_options()
	local config = { colors = colors }
	local theme = require("cabin.theme").setup(config)

	for _,section in pairs(theme) do
		for _, group in ipairs(section) do
			local highlight_command = stringify_group(group)
			vim.cmd(highlight_command)
		end
	end
end

return M
