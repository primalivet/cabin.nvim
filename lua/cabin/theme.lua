local M = {}

function M.setup(config)
	local cs = config.colors
	config.options = {
		fat_vert_split = false,
	}
	local theme = {}

	theme.base = {
		{ name = "CabinElevateDown1", fg = cs.fg, bg = cs.elevation.down1 },
		{ name = "CabinElevateDown2", fg = cs.fg, bg = cs.elevation.down2 },
		{ name = "ColorColumn", bg = cs.red },
		{ name = "Conceal" },
		{ name = "Cursor", bg = cs.yellow },
		{ name = "CursorColumn", bg = cs.elevation.up1 },
		{ name = "CursorIM", link = "Cursor" },
		{ name = "CursorLine", bg = cs.elevation.up1 },
		{ name = "CursorLineNr" },
		{ name = "DiffAdd", fg = cs.black, bg = cs.green },
		{ name = "DiffChange", fg = cs.black, bg = cs.yellow },
		{ name = "DiffDelete", fg = cs.black, bg = cs.red },
		{ name = "DiffText", style = "underline" },
		{ name = "Directory" },
		{ name = "EndOfBuffer", link = "NonText" },
		{ name = "ErrorMsg", fg = cs.red, style = 'bold' },
		{ name = "FoldColumn" },
		{ name = "Folded", fg = cs.fg, bg = cs.elevation.up1 },
		{ name = "IncSearch", fg = cs.black, bg = cs.highlight },
		{ name = "LineNr", fg = cs.grey7 },
		{ name = "LineNrAbove", link = "LineNr" },
		{ name = "LineNrBelow", link = "LineNr" },
		{ name = "MatchParen", fg = cs.highlight, style = "bold" },
		{ name = "ModeMsg", fg = cs.fg, style = "bold" },
		{ name = "MoreMsg", fg = cs.fg, style = "bold" },
		{ name = "MsgArea" },
		{ name = "MsgSeparator", link = "MoreMsg" },
		{ name = "NonText", fg = cs.grey },
		{ name = "Normal", fg = cs.fg, bg = cs.bg },
		{ name = "NormalFloat", bg = cs.elevation.up1 },
		{ name = "NormalNC", link = "Normal" },
		{ name = "Pmenu", bg = cs.elevation.up1 },
		{ name = "PmenuSbar", bg = cs.elevation.up2 },
		{ name = "PmenuSel", fg = cs.bg, bg = cs.highlight },
		{ name = "PmenuThumb", bg = cs.elevation.up3 },
		{ name = "Question", fg = cs.green },
		{ name = "QuickFixLine", fg = cs.black, bg = cs.highlight },
		{ name = "Search", fg = cs.black, bg = cs.highlight },
		{ name = "SignColumn" },
		{ name = "SpecialKey" },
		{ name = "SpellBad", sp = cs.red, style = "undercurl" },
		{ name = "SpellCap", sp = cs.yellow, style = "undercurl" },
		{ name = "SpellLocal", sp = cs.fg, style = "undercurl" },
		{ name = "SpellRare", sp = cs.fg, style = "undercurl" },
		{ name = "StatusLine", fg = cs.fg, bg = cs.elevation.up1 },
		{ name = "StatusLineNC", bg = cs.bg },
		{ name = "Substitute" },
		{ name = "TabLine", bg = cs.elevation.down2 },
		{ name = "TabLineFill", bg = cs.elevation.down2 },
		{ name = "TabLineSel", fg = cs.highlight, bg = cs.bg },
		{ name = "TermCursor", link = "Cursor" },
		{ name = "TermCursorNC", link = "Cursor" },
		{ name = "Title" },
		{ name = "VertSplit", fg = cs.elevation.up1, bg = config.options.fat_vert_split and cs.elevation.up1 or cs.none },
		{ name = "Visual", bg = cs.elevation.up2 },
		{ name = "VisualNOS", link = "Visual" },
		{ name = "WarningMsg", fg = cs.yellow, style = "bold" },
		{ name = "Whitespace", link = "NonText" },
		{ name = "WildMenu", link = "PmenuSel" },
		{ name = "lCursor", link = "Cursor" },
	}

	vim.cmd([[
  augroup CabinStyles
    autocmd!
    autocmd FileType fzf setlocal winhighlight=Normal:CabinElevateDown1
    autocmd FileType packer setlocal winhighlight=Normal:CabinElevateDown1
    autocmd FileType NeogitStatus setlocal winhighlight=Normal:CabinElevateDown1
  augroup END
  ]])

	theme.statusline = {
		{ name = "StatusLineRed", fg = cs.red, bg = cs.elevation.up1 },
		{ name = "StatusLineGreen", fg = cs.green, bg = cs.elevation.up1 },
		{ name = "StatusLineYellow", fg = cs.yellow, bg = cs.elevation.up1 },
		{ name = "StatusLineBlue", fg = cs.blue, bg = cs.elevation.up1 },
		{ name = "StatusLineCyan", fg = cs.cyan, bg = cs.elevation.up1 },
		{ name = "StatusLineMagentan", fg = cs.magentan, bg = cs.elevation.up1 },
		{ name = "StatusLineOrange", fg = cs.orange, bg = cs.elevation.up1 },
		{ name = "StatusLinePink", fg = cs.pink, bg = cs.elevation.up1 },
		{ name = "StatusLinePurple", fg = cs.purple, bg = cs.elevation.up1 },
	}

	theme.syntax = {
		{ name = "Comment", fg = cs.grey7, style = "italic" },

		{ name = "Constant", fg = cs.red },
		{ name = "String", fg = cs.green },
		{ name = "Character", fg = cs.bright_green },
		{ name = "Number", fg = cs.magentan, style = 'bold' },
		{ name = "Boolean", link = "Constant" },
		{ name = "Float", link = "Number" },

		{ name = "Identifier", fg = cs.cyan, style = "italic" },
		{ name = "Function", fg = cs.yellow, style = "bold" },

		{ name = "Statement", fg = cs.orange },
		{ name = "Conditional", link = "Statement" },
		{ name = "Repeat", link = "Statement" },
		{ name = "Label", link = "Statement" },
		{ name = "Operator", link = "Statement" },
		{ name = "Keyword", link = "Statement" },
		{ name = "Exception", link = "Statement" },

		{ name = "PreProc", fg = cs.blue},
		{ name = "Include", link = "PreProc" },
		{ name = "Define", link = "PreProc" },
		{ name = "Macro", link = "PreProc" },
		{ name = "PreCondit", link = "PreProc" },

		{ name = "Type", fg = cs.magentan },
		{ name = "StorageClass", link = "Type" },
		{ name = "Structure", link = "Type" },
		{ name = "Typedef", link = "Type" },

		{ name = "Special", fg = cs.fg },
		{ name = "SpecialChar", link = "Character" },
		{ name = "Tag", fg = cs.fg, style = 'bold' },
		{ name = "Delimiter", link = "Special" },
		{ name = "SpecialComment", link = "Special" },
		{ name = "Debug", link = "Special" },

		{ name = "Underlined", style = "underline" },
		{ name = "Ignore" },
		{ name = "Error", fg = cs.fg, cs.red },
		{ name = "Todo", fg = cs.bg, cs.yellow },
	}

	theme.plugins = {
		-- LSP
		-- GitSigns
		{ name = "GitSignsAdd", fg = cs.green },
		{ name = "GitSignsChange", fg = cs.yellow },
		{ name = "GitSignsDelete", fg = cs.red },
		-- Whichkey
		{ name = "WhichKey", fg = cs.highlight, style = "bold" }, -- Function	the key
		{ name = "WhichKeyGroup", fg = cs.red }, --Keyword	a group
		{ name = "WhichKeySeparator", fg = cs.green }, --	DiffAdded	the separator between the key and its label
		{ name = "WhichKeyDesc", fg = cs.fg }, -- Identifier	the label of the key
		{ name = "WhichKeyFloat", link = "CabinElevateDown1" }, -- NormalFloat	Normal in the popup window
		{ name = "WhichKeyValue", fg = cs.fg }, -- Comment	used by plugins that provide values
	}

	return theme
end

return M
