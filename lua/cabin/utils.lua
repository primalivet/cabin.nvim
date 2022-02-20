local M = {}

M.stringify_group = function(group)
	local name = group.name and group.name or ""
	local link = group.link and group.link or nil
	local fg = group.fg and "guifg=" .. group.fg or "guifg=NONE"
	local bg = group.bg and "guibg=" .. group.bg or "guibg=NONE"
	local sp = group.sp and "guisp=" .. group.sp or "guisp=NONE"
	local style = group.style and "gui=" .. group.style or "gui=NONE"
	return link and string.format("hi link %s %s", name, link)
		or string.format("hi %s %s %s %s %s", name, fg, bg, sp, style)
end

return M
