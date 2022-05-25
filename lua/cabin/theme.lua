local M = {}

function M.setup(config)
	local cs = config.options.colors
	if config.options.fear_of_the_dark then
		cs.bg = cs.grey0
		cs.elevation = {
			down2 = cs.black,
			down1 = cs.black,
			up1 = cs.gre2,
			up2 = cs.grey3,
			up3 = cs.grey4,
		}
	end
	local theme = {}

	theme.base = {
		-- Theme groups
		{ name = "CabinElevateDown1", fg = cs.fg, bg = cs.elevation.down1 },
		{ name = "CabinElevateDown2", fg = cs.fg, bg = cs.elevation.down2 },
		-- Normal
		{ name = "Normal", fg = cs.fg, bg = cs.bg },
		{ name = "NormalFloat", bg = cs.elevation.up1 },
		{ name = "NormalNC", link = "Normal" },
		-- Lines
		{ name = "LineNr", fg = cs.grey7 },
		{ name = "LineNrAbove", link = "LineNr" },
		{ name = "LineNrBelow", link = "LineNr" },
		{ name = "Folded", fg = cs.grey8, bg = cs.elevation.up1 },
		{ name = "QuickFixLine", fg = cs.black, bg = cs.highlight },
		-- Columns
		{ name = "ColorColumn", bg = cs.red },
		{ name = "FoldColumn", fg = cs.grey8, bg = config.options.colored_columns and cs.elevation.up2 or cs.none },
		{ name = "SignColumn", bg = config.options.colored_columns and cs.elevation.up1 or cs.none },
		-- Cursor
		{ name = "Cursor", fg = cs.black, bg = cs.bright_magenta },
		{ name = "CursorColumn", bg = cs.elevation.up1 },
		{ name = "CursorIM", link = "Cursor" },
		{ name = "CursorLine", bg = cs.elevation.up1 },
		{ name = "CursorLineNr" },
		{ name = "lCursor", link = "Cursor" },
		-- Diffs
		{ name = "DiffAdd", fg = cs.green, bg = cs.none },
		{ name = "DiffChange", fg = cs.yellow, bg = cs.none },
		{ name = "DiffDelete", fg = cs.red, bg = cs.none },
		{ name = "DiffText", style = "underline" },
		-- Messages
		{ name = "ErrorMsg", fg = cs.red, style = "bold" },
		{ name = "ModeMsg", fg = cs.fg, style = "bold" },
		{ name = "MoreMsg", fg = cs.fg, style = "bold" },
		{ name = "MsgArea" },
		{ name = "MsgSeparator", link = "MoreMsg" },
		{ name = "WarningMsg", fg = cs.yellow, style = "bold" },
		{ name = "Question", fg = cs.green },
		-- Search and highlight
		{ name = "IncSearch", fg = cs.black, bg = cs.highlight },
		{ name = "MatchParen", fg = cs.bright_magenta, style = "bold" },
		{ name = "Search", fg = cs.black, bg = cs.highlight },
		{ name = "Substitute", link = "Search" },
		-- Pmenu
		{ name = "Pmenu", bg = cs.elevation.up1 },
		{ name = "PmenuSbar", bg = cs.elevation.up2 },
		{ name = "PmenuSel", fg = cs.highlight, bg = cs.elevation.up2 },
		{ name = "PmenuThumb", bg = cs.elevation.up3 },
		{ name = "WildMenu", link = "PmenuSel" },
		-- Statusline
		{ name = "StatusLine", fg = cs.fg, bg = cs.elevation.up1 },
		{ name = "StatusLineNC", bg = cs.bg },
		-- TabLine
		-- TODO: problem when options pitch_black
		{ name = "TabLine", bg = cs.elevation.down2 },
		{ name = "TabLineFill", bg = cs.elevation.down2 },
		{ name = "TabLineSel", fg = cs.highlight, bg = cs.bg },
		-- Terminal
		{ name = "TermCursor", link = "Cursor" },
		{ name = "TermCursorNC", link = "Cursor" },
		-- Visual
		{ name = "Visual", bg = cs.elevation.up2 },
		{ name = "VisualNOS", link = "Visual" },
		-- Spell
		{ name = "SpellBad", sp = cs.red, style = "undercurl" },
		{ name = "SpellCap", sp = cs.yellow, style = "undercurl" },
		{ name = "SpellLocal", sp = cs.fg, style = "undercurl" },
		{ name = "SpellRare", sp = cs.fg, style = "undercurl" },
		-- Misc
		{ name = "Conceal" },
		{ name = "Directory", fg = cs.magenta, style = "bold" },
		{ name = "NonText", fg = cs.grey6 },
		{ name = "EndOfBuffer", link = "NonText" },
		{ name = "SpecialKey" },
		{ name = "Title" },
		{ name = "VertSplit", fg = cs.elevation.up1, bg = config.options.fat_vert_split and cs.elevation.up1 or cs.none },
		{ name = "Whitespace", link = "NonText" },
	}

	theme.statusline = {
		{ name = "StatusLineYellowBg", fg = cs.bg, bg = cs.yellow },
		{ name = "StatusLineRed", fg = cs.red, bg = cs.elevation.up1 },
		{ name = "StatusLineGreen", fg = cs.green, bg = cs.elevation.up1 },
		{ name = "StatusLineYellow", fg = cs.yellow, bg = cs.elevation.up1 },
		{ name = "StatusLineBlue", fg = cs.blue, bg = cs.elevation.up1 },
		{ name = "StatusLineCyan", fg = cs.cyan, bg = cs.elevation.up1 },
		{ name = "StatusLineMagenta", fg = cs.magenta, bg = cs.elevation.up1 },
	}

	theme.syntax = {
		{ name = "Comment", fg = cs.grey7, style = "italic" },

		{ name = "Constant", fg = cs.cyan },
		{ name = "String", fg = cs.bright_green },
		{ name = "Character", fg = cs.bright_green, style = "italic" },
		{ name = "Number", link = "Constant" },
		{ name = "Boolean", link = "Constant" },
		{ name = "Float", link = "Number" },

		{ name = "Identifier", fg = cs.fg },
		{ name = "Function", fg = cs.yellow, style = "bold" },

		{ name = "Statement", fg = cs.bright_red },
		{ name = "Conditional", link = "Statement" },
		{ name = "Repeat", link = "Statement" },
		{ name = "Label", fg = cs.green },
		{ name = "Operator", fg = cs.yellow },
		{ name = "Keyword", link = "Statement" },
		{ name = "Exception", link = "Statement" },

		{ name = "PreProc", fg = cs.bright_magenta },
		{ name = "Include", link = "PreProc" },
		{ name = "Define", link = "PreProc" },
		{ name = "Macro", link = "PreProc" },
		{ name = "PreCondit", link = "PreProc" },

		{ name = "Type", fg = cs.bright_cyan },
		{ name = "StorageClass", link = "Type" },
		{ name = "Structure", link = "Type" },
		{ name = "Typedef", link = "Type" },

		{ name = "Special", fg = cs.fg },
		{ name = "SpecialChar", link = "Character" },
		{ name = "Tag", fg = cs.green, style = "bold" },
		{ name = "Delimiter", fg = cs.fg },
		{ name = "SpecialComment", fg = cs.fg },
		{ name = "Debug", fg = cs.fg },

		{ name = "Underlined", style = "underline" },
		{ name = "Ignore" },
		{ name = "Error", style = "underline", sp = cs.red },
		{ name = "Todo", fg = cs.bg, bg = cs.highlight },

		-- None, String, Emphasis is defined to support linking from other groups.
		-- One scenario is when somethin refers to normal in syntax
		-- will overwrite the background of cursorline.
		{ name = "None", fg = cs.fg },
		{ name = "Bold", style = cs.bold },
		{ name = "Emphasis", style = cs.italic },
	}

	theme.quickfix = {
		{ name = "qfFileName", fg = cs.bright_green, style = "bold" },
	}

	-- Netrw
	theme.netrw = {
		{ name = "netrwDir", link = "Directory" },
		{ name = "netrwPlain", fg = cs.bright_magenta },
		{ name = "netrwHdr", link = "netrwPlain" },
		{ name = "netrwLex", link = "netrwPlain" },
		{ name = "netrwYacc", link = "netrwPlain" },
		{ name = "netrwComment", link = "Comment" },
		{ name = "netrwHide", link = "netrwComment" },
		{ name = "netrwHideSep", link = "netrwComment" },
		{ name = "netrwComma", link = "netrwComment" },

		{ name = "netrwHelpCmd", fg = cs.highlight, style = "bold" },
		{ name = "netrwCmdNote", fg = cs.bright_green },

		{ name = "netrwClassify", link = "Function" }, -- Directory trailing slash
		{ name = "netrwLink", link = "netrwClassify" },
		{ name = "netrwSymLink", link = "netrwClassify" },

		-- TODO: Deside on netrw group below
		{ name = "netrwVersion", link = "Identifier" },
		{ name = "netrwExe", link = "PreProc" },
		{ name = "netrwDateSep", link = "Delimiter" },
		{ name = "netrwTreeBar", link = "Special" },
		{ name = "netrwHidePat", link = "Statement" },
		{ name = "netrwList", link = "Statement" },
		{ name = "netrwQHTopic", link = "Number" },
		{ name = "netrwCmdSep", link = "Delimiter" },
		{ name = "netrwMarkFile", link = "TabLineSel" },
		{ name = "netrwCoreDump", link = "WarningMsg" },
		{ name = "netrwData", link = "Folded" },
		{ name = "netrwLib", link = "DiffChange" },
		{ name = "netrwMakefile", link = "DiffChange" },
		{ name = "netrwPix", link = "Special" },

		{ name = "netrwTimeSep", link = "netrwDateSep" },

		{ name = "netrwGray", link = "Folded" },
		{ name = "netrwBak", link = "netrwGray" },
		{ name = "netrwCompress", link = "netrwGray" },
		{ name = "netrwSpecFile", link = "netrwGray" },
		{ name = "netrwObj", link = "netrwGray" },
		{ name = "netrwTags", link = "netrwGray" },
		{ name = "netrwTilde", link = "netrwGray" },
		{ name = "netrwTmp", link = "netrwGray" },

		--		{ name = "netrwSortBy", cleared = true},
		--		{ name = "netrwSortSeq", cleared = true},
		--		{ name = "netrwQuickHelp", cleared = true},
		--		{ name = "netrwCopyTgt", cleared = true},
		--		{ name = "netrwSpecial", cleared = true},
		--		{ name = "netrwTime", cleared = true},
		--		{ name = "netrwSizeDate", cleared = true},
		--		{ name = "netrwTreeBarSpace", cleared = true},
		--		{ name = "netrwSlash", cleared = true},
	}

	-- LSP References
	theme.lsp_references = {
		{ name = "LspReferenceText", bg = cs.elevation.up2 },
		{ name = "LspReferenceRead", bg = cs.elevation.up2 },
		{ name = "LspReferenceWrite", bg = cs.elevation.up2 },
	}

	-- LSP Diagnostics
	theme.lsp_diagnostics = {
		{ name = "DiagnosticError", fg = cs.red },
		{ name = "DiagnosticWarn", fg = cs.yellow },
		{ name = "DiagnosticInfo", fg = cs.grey7 },
		{ name = "DiagnosticHint", fg = cs.grey7 },
		{
			name = "DiagnosticSignError",
			fg = cs.red,
			bg = config.options.colored_columns and cs.elevation.up1 or cs.none,
		},
		{
			name = "DiagnosticSignWarn",
			fg = cs.yellow,
			bg = config.options.colored_columns and cs.elevation.up1 or cs.none,
		},
		{
			name = "DiagnosticSignInfo",
			fg = cs.grey7,
			bg = config.options.colored_columns and cs.elevation.up1 or cs.none,
		},
		{
			name = "DiagnosticSignHint",
			fg = cs.grey7,
			bg = config.options.colored_columns and cs.elevation.up1 or cs.none,
		},
		{ name = "DiagnosticUnderlineError", style = "underline", sp = cs.red },
		{ name = "DiagnosticUnderlineWarn", style = "underline", sp = cs.yellow },
		{ name = "DiagnosticUnderlineInfo", style = "underline", sp = cs.grey7 },
		{ name = "DiagnosticUnderlineHint", style = "underline", sp = cs.grey7 },
		{ name = "DiagnosticVirtualTextError", fg = cs.red, style = "italic" },
		{ name = "DiagnosticVirtualTextWarn", fg = cs.yellow, style = "italic" },
		{ name = "DiagnosticVirtualTextInfo", fg = cs.grey7, style = "italic" },
		{ name = "DiagnosticVirtualTextHint", fg = cs.grey7, style = "italic" },
	}

	-- Copilot Suggestion
	theme.copilot = {
		{ name = "CopilotSuggestion", link = "Comment" },
	}

	-- CMP Completion engine
	theme.cmp = {
		{ name = "CmpItemAbbr", fg = cs.fg },
		{ name = "CmpItemAbbrDeprecated", fg = cs.red, sp = cs.red, style = "undercurl" },
		{ name = "CmpItemAbbrMatch", fg = cs.highlight },
		{ name = "CmpItemAbbrMatchFuzzy", fg = cs.highlight },
		{ name = "CmpItemKind", fg = cs.grey7 },
		{ name = "CmpItemMenu", fg = cs.grey6 },

		{ name = "CmpItemKindText", link = "CmpItemKind" },
		{ name = "CmpItemKindMethod", link = "Function" },
		{ name = "CmpItemKindFunction", link = "Function" },
		{ name = "CmpItemKindConstructor", link = "CmpItemKind" },
		{ name = "CmpItemKindField", link = "Label" },
		{ name = "CmpItemKindVariable", link = "Identifier" },
		{ name = "CmpItemKindClass", link = "Type" },
		{ name = "CmpItemKindInterface", link = "Type" },
		{ name = "CmpItemKindModule", link = "PreProc" },
		{ name = "CmpItemKindProperty", link = "Label" },
		{ name = "CmpItemKindUnit", link = "Constant" },
		{ name = "CmpItemKindValue", link = "CmpItemKind" },
		{ name = "CmpItemKindEnum", link = "Type" },
		{ name = "CmpItemKindKeyword", link = "Keyword" },
		{ name = "CmpItemKindSnippet", link = "CmpItemKind" },
		{ name = "CmpItemKindColor", link = "CmpItemKind" },
		{ name = "CmpItemKindFile", link = "netrwPlain" },
		{ name = "CmpItemKindReference", link = "CmpItemKind" },
		{ name = "CmpItemKindFolder", link = "netrwDir" },
		{ name = "CmpItemKindEnumMember", link = "Type" },
		{ name = "CmpItemKindConstant", link = "Constant" },
		{ name = "CmpItemKindStruct", link = "Structure" },
		{ name = "CmpItemKindEvent", link = "CmpItemKind" },
		{ name = "CmpItemKindOperator", link = "Operator" },
		{ name = "CmpItemKindTypeParameter", link = "Identifier" },

		-- TODO: *CmpItemKind%KIND_NAME%*
		--   The kind field's highlight group for specific `lsp.CompletionItemKind`.
		--   If you want to overwrite only the method kind's highlight group, you can do this.
		--      Example: highlight CmpItemKindMethod guibg=NONE guifg=Orange
	}

	-- GitSigns
	theme.gitsigns = {
		{ name = "GitSignsAdd", fg = cs.green, bg = config.options.colored_columns and cs.elevation.up1 or cs.none },
		{ name = "GitSignsChange", fg = cs.yellow, bg = config.options.colored_columns and cs.elevation.up1 or cs.none },
		{ name = "GitSignsDelete", fg = cs.red, bg = config.options.colored_columns and cs.elevation.up1 or cs.none },
	}

	-- TODO: LSP Saga
	-- theme.lspsaga = {}

	-- TODO: GitGutter
	-- theme.gitgutter = {}

	-- TODO: Neogit
	-- theme.neogit = {}

	-- Trouble
	theme.trouble = {
		{ name = "TroubleNormal", link = "CabinElevateDown1" },
		{ name = "TroubleFoldIcon", fg = cs.bright_magenta, style = "bold" },
		{ name = "TroubleSignInformation", link = "DiagnosticSignInfo" },
		{ name = "TroubleSignOther", link = "TroubleSignInformation" },
		{ name = "TroubleLocation", fg = cs.bright_magenta },
		{ name = "TroubleCount ", fg = cs.bright_green, style = "bold" },

		{ name = "TroubleText  ", link = "None" },
		{ name = "TroubleTextError", link = "TroubleText" },
		{ name = "TroubleTextWarning", link = "TroubleText" },
		{ name = "TroubleTextInformation", link = "TroubleText" },
		{ name = "TroubleTextHint", link = "TroubleText" },

		{ name = "TroublePreview", link = "Search" },
		{ name = "TroubleSource", link = "Comment" },
		{ name = "TroubleFile  ", fg = cs.yellow },
		{ name = "TroubleIndent", link = "Comment" },
		{ name = "TroubleCode  ", link = "Comment" },

		{ name = "TroubleOther ", link = "DiagnosticOther" },
		{ name = "TroubleError ", link = "DiagnosticError" },
		{ name = "TroubleSignError", link = "DiagnosticSignError" },
		{ name = "TroubleWarning", link = "DiagnosticWarn" },
		{ name = "TroubleSignWarning", link = "DiagnosticSignWarn" },
		{ name = "TroubleInformation", link = "DiagnosticInfo" },
		{ name = "TroubleHint  ", link = "DiagnosticHint" },
		{ name = "TroubleSignHint", link = "DiagnosticSignHint" },
	}

	-- Indent blankline
	theme.indent_blankline = {
		{ name = "IndentBlanklineSpaceCharBlankline", style = "nocombine" },
		{ name = "IndentBlanklineContextChar", fg = cs.highlight, style = "nocombine" },
		{ name = "IndentBlanklineChar", fg = cs.grey6, style = "nocombine" },
		{ name = "IndentBlanklineSpaceChar", style = "nocombine" },
		{ name = "IndentBlanklineContextStart", style = "underline", sp = cs.highlight },
	}

	-- TODO: Feline
	-- theme.lualine = {}

	-- TODO: Nvim Tree
	-- theme.nvim_tree = {}

	-- Whichkey
	theme.whichkey = {
		{ name = "WhichKey", fg = cs.highlight, style = "bold" }, -- Function	the key
		{ name = "WhichKeyGroup", fg = cs.red }, --Keyword	a group
		{ name = "WhichKeySeparator", fg = cs.green }, --	DiffAdded	the separator between the key and its label
		{ name = "WhichKeyDesc", fg = cs.fg }, -- Identifier	the label of the key
		{ name = "WhichKeyFloat", link = "CabinElevateDown1" }, -- NormalFloat	Normal in the popup window
		{ name = "WhichKeyValue", fg = cs.fg }, -- Comment	used by plugins that provide values
	}

	-- Telescope
	theme.telescope = {
		{ name = "TelescopeSelection", fg = cs.highlight, bg = cs.elevation.up2, style = "bold" },
		{ name = "TelescopeSelectionCaret", fg = cs.bright_magenta, style = "bold" },
		{ name = "TelescopeMultiSelection", fg = cs.green, style = "italic" },
		{ name = "TelescopeMultiIcon", fg = cs.green, style = "bold" },
		{ name = "TelescopeNormal", fg = cs.fg, bg = cs.elevation.down1 },
		{ name = "TelescopeBorder", fg = cs.elevation.up1 },
		{ name = "TelescopeTitle", fg = cs.fg },
		{ name = "TelescopePromptCounter", fg = cs.bright_blue },
		{ name = "TelescopeMatching", fg = cs.bright_magenta, style = "bold" },
		{ name = "TelescopePromptPrefix", fg = cs.bright_magenta, style = "bold" },
	}

	-- FZF
	theme.fzf = {
		{ name = "FZFBorder", fg = cs.elevation.up1 },
		{ name = "FZFForeground", fg = cs.fg },
		{ name = "FZFForegroundPlus", fg = cs.highlight, style = "bold" }, -- fg = selected result
		{ name = "FZFHeader", bg = cs.fg },
		{ name = "FZFHighlight", fg = cs.highlight, bg = cs.elevation.down1 },
		{ name = "FZFHighlightPlus", fg = cs.bright_magenta, style = "bold" }, -- fg = fuzzy match in selected result
		{ name = "FZFInfo", fg = cs.fg },
		{ name = "FZFMarker", fg = cs.bright_magenta },
		{ name = "FZFPointer", fg = cs.bright_magenta },
		{ name = "FZFPrompt", fg = cs.bright_magenta },
		{ name = "FZFSpinner", fg = cs.bright_green },
	}

	-- Treesitter
	theme.treesitter = {
		{ name = "TSAttribute", link = "None" },
		{ name = "TSBoolean", link = "Boolean" },
		{ name = "TSCharacter", link = "Character" },
		{ name = "TSComment", link = "Comment" },
		{ name = "TSConditional", link = "Conditional" },
		{ name = "TSConstant", link = "Constant" },
		{ name = "TSConstBuiltin", link = "Constant" },
		{ name = "TSConstMacro", link = "Constant" },
		{ name = "TSConstructor", link = "None" },
		{ name = "TSError", link = "Error" },
		{ name = "TSException", link = "Exception" },
		{ name = "TSField", link = "Label" },
		{ name = "TSFloat", link = "Float" },
		{ name = "TSFunction", link = "Function" },
		{ name = "TSFuncBuiltin", link = "Function" },
		{ name = "TSFuncMacro", link = "Function" },
		{ name = "TSInclude", link = "Include" },
		{ name = "TSKeyword", link = "Keyword" },
		{ name = "TSKeywordFunction", link = "Function" },
		{ name = "TSKeywordOperator", link = "Operator" },
		{ name = "TSKeywordReturn", link = "Keyword" },
		{ name = "TSLabel", link = "Label" },
		{ name = "TSMethod", link = "Function" },
		{ name = "TSNamespace", link = "Identifier" },
		{ name = "TSNone", link = "None" },
		{ name = "TSNumber", link = "Number" },
		{ name = "TSOperator", link = "Operator" },
		{ name = "TSParameter", link = "Identifier" },
		{ name = "TSParameterReference", link = "Identifier" },
		{ name = "TSProperty", link = "Label" },
		{ name = "TSPunctDelimiter", link = "Delimiter" },
		{ name = "TSPunctBracket", link = "Delimiter" },
		{ name = "TSPunctSpecial", link = "Delimiter" },
		{ name = "TSRepeat", link = "Repeat" },
		{ name = "TSString", link = "String" },
		{ name = "TSStringRegex", link = "Character" },
		{ name = "TSStringEscape", link = "Charater" },
		{ name = "TSSymbol", link = "Identifier" },
		{ name = "TSTag", link = "Tag" },
		{ name = "TSTagAttribute", link = "Identifier" },
		{ name = "TSTagDelimiter", link = "Delimiter" },
		{ name = "TSText", link = "None" },
		{ name = "TSStrong", link = "Strong" },
		{ name = "TSEmphasis", link = "Emphasis" },
		{ name = "TSUnderline", link = "Underline" },
		{ name = "TSStrike", link = "None" },
		{ name = "TSTitle", link = "Title" },
		{ name = "TSLiteral", link = "None" },
		{ name = "TSURI", link = "None" },
		{ name = "TSMath", link = "None" },
		{ name = "TSTextReference", link = "None" },
		{ name = "TSEnviroment", link = "None" },
		{ name = "TSEnviromentName", link = "None" },
		{ name = "TSNote", link = "Todo" },
		{ name = "TSWarning", link = "WarningMsg" },
		{ name = "TSDanger", link = "ErrorMsg" },
		{ name = "TSType", link = "Type" },
		{ name = "TSTypeBuiltin", link = "Type" },
		{ name = "TSVariable", link = "Identifier" },
		{ name = "TSVariableBuiltin", link = "Keyword" },
	}

	-- TODO: Move
	vim.cmd([[
  augroup CabinStyles
    autocmd!
    autocmd FileType fzf setlocal winhighlight=Normal:CabinElevateDown1
    autocmd FileType packer setlocal winhighlight=Normal:CabinElevateDown1
    autocmd FileType NeogitStatus setlocal winhighlight=Normal:CabinElevateDown1
    autocmd FileType qf setlocal winhighlight=Normal:CabinElevateDown1
    autocmd FileType help setlocal winhighlight=Normal:CabinElevateDown1
    autocmd FileType netrw setlocal winhighlight=Normal:CabinElevateDown1
  augroup END
  ]])

	-- Fzf
	-- TODO: Move FZF global var somewhere more obvious
	vim.g.fzf_colors = {
		fg = { "fg", "FZFForeground" },
		bg = { "bg", "FZFHighlight" },
		hl = { "fg", "FZFHighlight" },
		["fg+"] = { "fg", "FZFForegroundPlus" },
		["bg+"] = { "bg", "FZFHighlightPlus" },
		["hl+"] = { "fg", "FZFHighlightPlus" },
		info = { "fg", "FZFInfo" },
		border = { "fg", "FZFBorder" },
		prompt = { "fg", "FZFPrompt" },
		pointer = { "fg", "FZFPointer" },
		marker = { "fg", "FZFMarker" },
		spinner = { "fg", "FZFSpinner" },
		header = { "fg", "FZFHeader" },
	}

	return theme
end

return M
