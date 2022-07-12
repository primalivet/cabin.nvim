local M = {}

-- HiGroup {
--   name: String,
--   link?: String (GroupName)
--   fg: String (HEX)
--   bg: String (HEX)
--   style: String (Bold,Italics,Reverse)
-- }

function M.setup(config)
	local theme = {}
	local palette = config.colors
	local light = config.light
	local cs = {}

	if light then
		cs.fg = palette.shade_dark3
		cs.bg = config.fear_of_the_dark and palette.shade_light4 or palette.shade_light2

		cs.highlight = palette.blue_dark -- Highlight: Interaction and selection in the UI
		cs.success = palette.green_dark
		cs.warning = palette.yellow_dark
		cs.failure = palette.red_dark
		cs.info = palette.fg
		cs.dimmed = palette.shade_light8

		cs.syntax_control = palette.green_dark -- Control: Control flow and operator "words" such as "if", "else", "for", "while", "return" etc.
		cs.syntax_symbols = palette.green_dark -- Symbols: Non word operators such as "=", "+", "-", "*", "/", "==", "!=", ">", ">=", "<", "<=" etc.
		cs.syntax_dimmed = palette.cyan_dark -- Dimmed: Comments, LSP normal text, etc.
		cs.syntax_types = palette.blue_medium -- Types: Types such as "int", "float", "char", "bool" and "builtin types like" like Array, String etc.
		cs.syntax_func = palette.blue_dark -- Func: Functions and method calls
		cs.syntax_string = palette.red_dark -- Strings: Strings and string like, e.g. regex and object keys
		cs.syntax_constant = palette.magenta_dark -- Constants: Constants like "PI", "e", "true", "false" and numbers

		cs.elevation = {
			up1 = config.fear_of_the_dark and palette.shade_light5 or palette.shade_light3,
			up2 = config.fear_of_the_dark and palette.shade_light6 or palette.shade_light4,
			up3 = config.fear_of_the_dark and palette.shade_light7 or palette.shade_light5,
		}
	else
		cs.fg = palette.shade_light3
		cs.bg = config.fear_of_the_dark and palette.black or palette.shade_dark2

		cs.highlight = palette.yellow_medium -- Highlight: Interaction and selection in the UI
		cs.success = palette.green_medium
		cs.warning = palette.yellow_medium
		cs.failure = palette.red_medium
		cs.info = palette.fg
		cs.dimmed = palette.shade_dark8

		cs.syntax_control = palette.red_light -- Control: Control flow and operator "words" such as "if", "else", "for", "while", "return" etc.
		cs.syntax_symbols = palette.red_light -- Symbols: Non word operators such as "=", "+", "-", "*", "/", "==", "!=", ">", ">=", "<", "<=" etc.
		cs.syntax_dimmed = palette.cyan_dark -- Dimmed: Comments, LSP normal text, etc.
		cs.syntax_types = palette.cyan_medium -- Types: Types such as "int", "float", "char", "bool" and "builtin types like" like Array, String etc.
		cs.syntax_func = palette.yellow_medium -- Func: Functions and method calls
		cs.syntax_string = palette.green_medium -- Strings: Strings and string like, e.g. regex and object keys
		cs.syntax_constant = palette.magenta_medium -- Constants: Constants like "PI", "e", "true", "false" and numbers

		cs.elevation = {
			up1 = config.fear_of_the_dark and palette.shade_dark1 or palette.shade_dark3,
			up2 = config.fear_of_the_dark and palette.shade_dark2 or palette.shade_dark4,
			up3 = config.fear_of_the_dark and palette.shade_dark3 or palette.shade_dark5,
		}
	end

	theme.base = {
		-- Normal
		{ name = "Normal", fg = cs.fg, bg = cs.bg },
		{ name = "NormalFloat", bg = cs.elevation.up2 },
		{ name = "NormalNC", link = "Normal" },
		-- Lines
		{ name = "LineNr", fg = cs.fg },
		{ name = "LineNrAbove", link = "LineNr" },
		{ name = "LineNrBelow", link = "LineNr" },
		{ name = "Folded", fg = cs.fg, bg = cs.elevation.up1 },
		{ name = "QuickFixLine", fg = cs.bg, bg = cs.highlight },
		-- Columns
		{ name = "ColorColumn", bg = cs.failure },
		{ name = "FoldColumn", fg = cs.dimmed, bg = config.colored_columns and cs.elevation.up2 or cs.none },
		{ name = "SignColumn", bg = config.colored_columns and cs.elevation.up1 or cs.none },
		-- Cursor
		{ name = "Cursor", fg = cs.bg, bg = cs.fg },
		{ name = "CursorColumn", bg = cs.elevation.up1 },
		{ name = "CursorIM", link = "Cursor" },
		{ name = "CursorLine", bg = cs.elevation.up1 },
		{ name = "CursorLineNr" },
		{ name = "lCursor", link = "Cursor" },
		-- Diffs
		{ name = "DiffAdd", bg = cs.success, fg = cs.bg },
		{ name = "DiffChange", bg = cs.warning, fg = cs.bg },
		{ name = "DiffDelete", bg = cs.failure, fg = cs.bg },
		{ name = "DiffText", bg = cs.warning, fg = cs.bg, style = "underline" },
		-- Messages
		{ name = "ErrorMsg", fg = cs.failure, style = "bold" },
		{ name = "ModeMsg", fg = cs.fg, style = "bold" },
		{ name = "MoreMsg", fg = cs.fg, style = "bold" },
		{ name = "MsgArea", fg = cs.highlight },
		{ name = "MsgSeparator", link = "MoreMsg" },
		{ name = "WarningMsg", fg = cs.warning, style = "bold" },
		{ name = "Question", fg = cs.info },
		-- Search and highlight
		{ name = "IncSearch", fg = cs.bg, bg = cs.highlight },
		{ name = "MatchParen", fg = cs.highlight, style = "bold" },
		{ name = "Search", fg = cs.bg, bg = cs.highlight },
		{ name = "Substitute", link = "Search" },
		-- Pmenu
		{ name = "Pmenu", bg = cs.elevation.up3 },
		{ name = "PmenuSbar", bg = cs.elevation.up2 },
		{ name = "PmenuSel", fg = cs.highlight, bg = cs.elevation.up2 },
		{ name = "PmenuThumb", bg = cs.elevation.up1 },
		-- { name = "WildMenu", link = "PmenuSel" },
		{ name = "WildMenu", fg = cs.bg, bg = cs.highlight },
		-- Statusline
		{ name = "StatusLine", fg = cs.bg, bg = cs.fg },
		{ name = "StatusLineNC", fg = cs.fg, bg = cs.elevation.up3 },
		-- TabLine
		-- TODO: problem when options pitch_black
		{ name = "TabLine", bg = cs.bg },
		{ name = "TabLineFill", bg = cs.bg },
		{ name = "TabLineSel", fg = cs.highlight, bg = cs.bg },
		-- Terminal
		{ name = "TermCursor", link = "Cursor" },
		{ name = "TermCursorNC", link = "Cursor" },
		-- Visual
		{ name = "Visual", fg = cs.bg, bg = cs.fg },
		{ name = "VisualNOS", link = "Visual" },
		-- Spell
		{ name = "SpellBad", sp = cs.failure, style = "undercurl" },
		{ name = "SpellCap", sp = cs.warning, style = "undercurl" },
		{ name = "SpellLocal", sp = cs.fg, style = "undercurl" },
		{ name = "SpellRare", sp = cs.fg, style = "undercurl" },
		-- Misc
		{ name = "Conceal" },
		{ name = "Directory", fg = cs.fg, style = "bold" },
		{ name = "NonText", fg = cs.dimmed },
		{ name = "EndOfBuffer", link = "NonText" },
		{ name = "SpecialKey" },
		{ name = "Title" },
		{ name = "VertSplit", fg = cs.elevation.up1, bg = config.fat_vert_split and cs.elevation.up1 or cs.none },
		{ name = "Whitespace", link = "NonText" },
	}

	theme.syntax = {
		{ name = "Comment", fg = cs.syntax_dimmed, style = "italic" },

		{ name = "Constant", fg = cs.fg },
		{ name = "String", fg = cs.syntax_string },
		{ name = "Character", fg = cs.syntax_string, style = "italic" },
		{ name = "Number",  fg = cs.syntax_constant },
		{ name = "Boolean", fg = cs.syntax_constant },
		{ name = "Float",   fg = cs.syntax_constant },

		{ name = "Identifier", fg = cs.fg},
		{ name = "Function", fg = cs.syntax_func, style = "bold" },

		{ name = "Statement", fg = cs.syntax_control, style = "bold" },
		{ name = "Conditional", link = "Statement" },
		{ name = "Repeat", link = "Statement" },
		{ name = "Label", fg = cs.fg },
		{ name = "Operator", fg = cs.syntax_symbols, style = "bold" },
		{ name = "Keyword", link = "Statement" },
		{ name = "Exception", link = "Statement" },

		{ name = "PreProc", fg = cs.dimmed },
		{ name = "Include", link = "PreProc" },
		{ name = "Define", link = "PreProc" },
		{ name = "Macro", link = "PreProc" },
		{ name = "PreCondit", link = "PreProc" },

		{ name = "Type", fg = cs.syntax_types },
		{ name = "StorageClass", link = "Type" },
		{ name = "Structure", link = "Type" },
		{ name = "Typedef", link = "Type" },
		{ name = "Special", fg = cs.fg },
		{ name = "SpecialChar", link = "Character" },
		{ name = "Tag", fg = cs.fg, style = "bold" },
		{ name = "Delimiter", fg = cs.fg },
		{ name = "SpecialComment", fg = cs.fg },
		{ name = "Debug", fg = cs.fg },

		{ name = "Underlined", style = "underline" },
		{ name = "Ignore" },
		{ name = "Error", style = "underline", sp = cs.failure },
		{ name = "Todo", fg = cs.bg, bg = cs.highlight },

		-- None, String, Emphasis is defined to support linking from other groups.
		-- One scenario is when somethin refers to normal in syntax
		-- will overwrite the background of cursorline.
		{ name = "None", fg = cs.fg },
		{ name = "Bold", style = cs.bold },
		{ name = "Emphasis", style = cs.italic },
	}

	theme.quickfix = {
		{ name = "qfFileName", fg = cs.fg, style = "italic" },
	}

	-- Netrw
	theme.netrw = {
		{ name = "netrwDir", link = "Directory" },
		{ name = "netrwPlain", fg = cs.fg },
		{ name = "netrwHdr", link = "netrwPlain" },
		{ name = "netrwLex", link = "netrwPlain" },
		{ name = "netrwYacc", link = "netrwPlain" },
		{ name = "netrwComment", link = "Comment" },
		{ name = "netrwHide", link = "netrwComment" },
		{ name = "netrwHideSep", link = "netrwComment" },
		{ name = "netrwComma", link = "netrwComment" },

		{ name = "netrwHelpCmd", fg = cs.highlight, style = "bold" },
		{ name = "netrwCmdNote", fg = cs.highlight },

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
	}

	-- LSP References
	theme.lsp_references = {
		{ name = "LspReferenceText", bg = cs.elevation.up2 },
		{ name = "LspReferenceRead", bg = cs.elevation.up2 },
		{ name = "LspReferenceWrite", bg = cs.elevation.up2 },
	}

	-- LSP Diagnostics
	theme.lsp_diagnostics = {
		{ name = "DiagnosticError", fg = cs.failure },
		{ name = "DiagnosticWarn", fg = cs.warning },
		{ name = "DiagnosticInfo", fg = cs.info },
		{ name = "DiagnosticHint", fg = cs.info },
		{
			name = "DiagnosticSignError",
			fg = cs.failure,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		{
			name = "DiagnosticSignWarn",
			fg = cs.warning,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		{
			name = "DiagnosticSignInfo",
			fg = cs.info,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		{
			name = "DiagnosticSignHint",
			fg = cs.info,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		{ name = "DiagnosticUnderlineError", style = "underline", sp = cs.failure },
		{ name = "DiagnosticUnderlineWarn", style = "underline", sp = cs.warning },
		{ name = "DiagnosticUnderlineInfo", style = "underline", sp = cs.info },
		{ name = "DiagnosticUnderlineHint", style = "underline", sp = cs.info },
		{ name = "DiagnosticVirtualTextError", fg = cs.failure, style = "italic" },
		{ name = "DiagnosticVirtualTextWarn", fg = cs.warning, style = "italic" },
		{ name = "DiagnosticVirtualTextInfo", fg = cs.info, style = "italic" },
		{ name = "DiagnosticVirtualTextHint", fg = cs.info, style = "italic" },
	}

	-- Copilot Suggestion
	theme.copilot = {
		{ name = "CopilotSuggestion", link = "Comment" },
	}

	-- CMP Completion engine
	theme.cmp = {
		{ name = "CmpItemAbbr", fg = cs.fg },
		{ name = "CmpItemAbbrDeprecated", fg = cs.failure, sp = cs.failure, style = "undercurl" },
		{ name = "CmpItemAbbrMatch", fg = cs.highlight },
		{ name = "CmpItemAbbrMatchFuzzy", fg = cs.highlight },
		{ name = "CmpItemKind", fg = cs.dimmed },
		{ name = "CmpItemMenu", fg = cs.dimmed },
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
		{ name = "GitSignsAdd", fg = cs.success, bg = config.colored_columns and cs.elevation.up1 or cs.none },
		{ name = "GitSignsChange", fg = cs.warning, bg = config.colored_columns and cs.elevation.up1 or cs.none },
		{ name = "GitSignsDelete", fg = cs.failure, bg = config.colored_columns and cs.elevation.up1 or cs.none },
	}

	-- TODO: LSP Saga
	-- theme.lspsaga = {}

	-- TODO: GitGutter
	-- theme.gitgutter = {}

	-- TODO: Neogit
	-- theme.neogit = {}

	-- Trouble
	theme.trouble = {
		{ name = "TroubleNormal", link = "Normal" },
		{ name = "TroubleFoldIcon", fg = cs.dimmed, style = "bold" },
		{ name = "TroubleSignInformation", link = "DiagnosticSignInfo" },
		{ name = "TroubleSignOther", link = "TroubleSignInformation" },
		{ name = "TroubleLocation", link = "Normal" },
		{ name = "TroubleCount ", fg = cs.fg, style = "bold" },

		{ name = "TroubleText", link = "None" },
		{ name = "TroubleTextError", link = "DiagnosticError" },
		{ name = "TroubleTextWarning", link = "DiagnosticWarn" },
		{ name = "TroubleTextInformation", link = "DiagnosticInfo" },
		{ name = "TroubleTextHint", link = "DiagnosticHint" },

		{ name = "TroublePreview", link = "Search" },
		{ name = "TroubleSource", link = "Comment" },
		{ name = "TroubleFile  ", link = "Normal" },
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
		{ name = "IndentBlanklineChar", fg = cs.dimmed, style = "nocombine" }, -- TODO: use general group
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
		{ name = "WhichKeyGroup", fg = cs.fg }, --Keyword	a group
		{ name = "WhichKeySeparator", fg = cs.dimmed }, --	DiffAdded	the separator between the key and its label
		{ name = "WhichKeyDesc", fg = cs.fg }, -- Identifier	the label of the key
		{ name = "WhichKeyFloat", link = "Float" }, -- NormalFloat	Normal in the popup window
		{ name = "WhichKeyValue", fg = cs.fg }, -- Comment	used by plugins that provide values
	}

	-- Telescope
	theme.telescope = {
		{ name = "TelescopeSelection", fg = cs.highlight, bg = cs.elevation.up2, style = "bold" },
		{ name = "TelescopeSelectionCaret", fg = cs.highlight, style = "bold" },
		{ name = "TelescopeMultiSelection", fg = cs.highlight, style = "italic" },
		{ name = "TelescopeMultiIcon", fg = cs.highlight, style = "bold" },
		{ name = "TelescopeNormal", link = "Normal" },
		{ name = "TelescopeBorder", fg = cs.elevation.up1 },
		{ name = "TelescopeTitle", fg = cs.fg },
		{ name = "TelescopePromptCounter", fg = cs.dimmed },
		{ name = "TelescopeMatching", fg = cs.highlight, style = "bold" },
		{ name = "TelescopePromptPrefix", fg = cs.dimmed, style = "bold" },
	}

	-- FZF
	theme.fzf = {
		{ name = "FZFBorder", fg = cs.elevation.up1 },
		{ name = "FZFForeground", fg = cs.fg },
		{ name = "FZFForegroundPlus", fg = cs.highlight, style = "bold" }, -- fg = selected result
		{ name = "FZFHeader", bg = cs.fg },
		{ name = "FZFHighlight", fg = cs.highlight, bg = cs.bg },
		{ name = "FZFHighlightPlus", fg = cs.highlight, bg = cs.bg, style = "bold" }, -- fg = fuzzy match in selected result
		{ name = "FZFInfo", fg = cs.fg },
		{ name = "FZFMarker", fg = cs.highlight },
		{ name = "FZFPointer", fg = cs.highlight },
		{ name = "FZFPrompt", fg = cs.fg },
		{ name = "FZFSpinner", fg = cs.fg },
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
