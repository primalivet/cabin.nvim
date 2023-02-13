local M = {}

M.stringify_group = function(group_name, group_highlight)
	local link = group_highlight.link and group_highlight.link or nil
	local fg = group_highlight.fg and "guifg=" .. group_highlight.fg or "guifg=NONE"
	local bg = group_highlight.bg and "guibg=" .. group_highlight.bg or "guibg=NONE"
	local sp = group_highlight.sp and "guisp=" .. group_highlight.sp or "guisp=NONE"
	local style = group_highlight.style and "gui=" .. group_highlight.style or "gui=NONE"
	return link and string.format("hi link %s %s", group_name, link)
		or string.format("hi %s %s %s %s %s", group_name, fg, bg, sp, style)
end

return M
