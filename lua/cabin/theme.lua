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
		cs.bg = palette.shade_light1

		cs.highlight = palette.blue_dark -- Highlight: Interaction and selection in the UI
		cs.success = palette.green_dark
		cs.warning = palette.yellow_dark
		cs.failure = palette.red_dark
		cs.info = palette.fg
		cs.dimmed = palette.shade_light8

		cs.syntax_control = palette.blue_dark -- Control: Control flow and operator "words" such as "if", "else", "for", "while", "return" etc.
		cs.syntax_symbols = palette.blue_dark -- Symbols: Non word operators such as "=", "+", "-", "*", "/", "==", "!=", ">", ">=", "<", "<=" etc.
		cs.syntax_dimmed = palette.cyan_dark -- Dimmed: Comments, LSP normal text, etc.
		cs.syntax_types = palette.cyan_medium -- Types: Types such as "int", "float", "char", "bool" and "builtin types like" like Array, String etc.
		cs.syntax_string = palette.green_dark -- Strings: Strings and string like, e.g. regex and object keys
		cs.syntax_constant = palette.magenta_dark -- Constants: Constants like "PI", "e", "true", "false" and numbers

		cs.elevation = {
			up1 = palette.shade_light2,
			up2 = palette.shade_light3,
			up3 = palette.shade_light4,
		}
	else
		cs.fg = palette.shade_light3
		cs.bg = palette.shade_dark1

		cs.highlight = palette.yellow_light -- Highlight: Interaction and selection in the UI
		cs.success = palette.green_medium
		cs.warning = palette.yellow_medium
		cs.failure = palette.red_medium
		cs.info = palette.fg
		cs.dimmed = palette.shade_dark7

		cs.syntax_control = palette.yellow_medium -- Control: Control flow and operator "words" such as "if", "else", "for", "while", "return" etc.
		cs.syntax_symbols = palette.yellow_medium -- Symbols: Non word operators such as "=", "+", "-", "*", "/", "==", "!=", ">", ">=", "<", "<=" etc.
		cs.syntax_dimmed = palette.cyan_medium -- Dimmed: Comments, LSP normal text, etc.
		cs.syntax_types = palette.cyan_light -- Types: Types such as "int", "float", "char", "bool" and "builtin types like" like Array, String etc.
		cs.syntax_func = palette.yellow_light -- Func: Functions and method calls
		cs.syntax_string = palette.green_medium -- Strings: Strings and string like, e.g. regex and object keys
		cs.syntax_constant = palette.magenta_medium -- Constants: Constants like "PI", "e", "true", "false" and numbers

		cs.elevation = {
			up1 = palette.shade_dark2,
			up2 = palette.shade_dark3,
			up3 = palette.shade_dark4,
		}
	end

	theme = {

		-- Basic groups

		ColorColumn = { bg = cs.failure },
		Conceal = {},
		Cursor = { fg = cs.bg, bg = cs.fg },
		CursorColumn = { bg = cs.elevation.up1 },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = cs.elevation.up1 },
		CursorLineNr = {},
		DiffAdd = { bg = cs.success, fg = cs.bg },
		DiffChange = { bg = cs.warning, fg = cs.bg },
		DiffDelete = { bg = cs.failure, fg = cs.bg },
		DiffText = { bg = cs.warning, fg = cs.bg, style = "underline" },
		Directory = { fg = cs.fg, style = "bold" },
		EndOfBuffer = { link = "NonText" },
		ErrorMsg = {
			fg = cs.fancy_pants and cs.failure or cs.fg,
			bg = cs.fancy_pants and cs.none or cs.failure,
			style = "bold",
		},
		FoldColumn = { fg = cs.dimmed, bg = config.fancy_pants and cs.none or cs.elevation.up2 },
		Folded = { fg = cs.fg, bg = cs.elevation.up1 },
		IncSearch = { fg = cs.bg, bg = cs.highlight },
		LineNr = { fg = config.fancy_pants and cs.dimmed or cs.highlight },
		LineNrAbove = { link = "LineNr" },
		LineNrBelow = { link = "LineNr" },
		MatchParen = { fg = cs.highlight, bg = cs.elevation.up2 },
		ModeMsg = { fg = cs.fg, style = "bold" },
		MoreMsg = { fg = cs.fg, style = "bold" },
		MsgArea = { fg = cs.highlight },
		MsgSeparator = { link = "MoreMsg" },
		NonText = { fg = cs.dimmed },
		Normal = { fg = cs.fg, bg = cs.bg },
		NormalFloat = { bg = cs.elevation.up2 },
		NormalNC = { link = "Normal" },
		Pmenu = { bg = cs.elevation.up3 },
		PmenuSbar = { bg = cs.elevation.up2 },
		PmenuSel = { fg = cs.highlight, bg = cs.elevation.up2 },
		PmenuThumb = { bg = cs.elevation.up1 },
		Question = { fg = cs.info },
		QuickFixLine = { fg = cs.bg, bg = cs.highlight },
		Search = { fg = cs.bg, bg = cs.highlight },
		SignColumn = { bg = config.fancy_pants and cs.none or cs.elevation.up1 },
		SpecialKey = {},
		SpellBad = { sp = cs.failure, style = "undercurl" },
		SpellCap = { sp = cs.warning, style = "undercurl" },
		SpellLocal = { sp = cs.fg, style = "undercurl" },
		SpellRare = { sp = cs.fg, style = "undercurl" },
		StatusLine = { fg = config.fancy_pants and cs.fg or cs.bg, bg = config.fancy_pants and cs.elevation.up1 or cs.fg },
		StatusLineNC = { fg = config.fancy_pants and cs.elevation.up3 or cs.fg, bg = cs.elevation.up1 },
		Substitute = { link = "Search" },
		TabLine = { bg = cs.bg },
		TabLineFill = { bg = cs.bg },
		TabLineSel = { fg = cs.highlight, bg = cs.bg },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		Title = {},
		VertSplit = {
			fg = config.fancy_pants and cs.fg or cs.elevation.up1,
			bg = config.fancy_pants and cs.elevation.up1 or cs.none,
		},
		Visual = { fg = cs.bg, bg = cs.highlight },
		VisualNOS = { link = "Visual" },
		WarningMsg = {
			fg = cs.fancy_pants and cs.warning or cs.bg,
			bg = cs.fancy_pants and cs.none or cs.warning,
			style = "bold",
		},
		Whitespace = { link = "NonText" },
		WildMenu = { fg = cs.bg, bg = cs.highlight },
		lCursor = { link = "Cursor" },

		-- Syntax

		Boolean = { fg = cs.syntax_constant },
		Character = { fg = cs.syntax_string, style = "italic" },
		Comment = { fg = cs.syntax_dimmed, style = "italic" },
		Conditional = { link = "Statement" },
		Constant = { fg = cs.fg },
		Debug = { fg = cs.fg },
		Define = { link = "PreProc" },
		Delimiter = { fg = cs.fg },
		Error = { style = "underline", sp = cs.failure },
		Exception = { link = "Statement" },
		Float = { fg = cs.syntax_constant },
		Function = { fg = cs.syntax_func, style = "bold" },
		Ignore = {},
		Include = { link = "PreProc" },
		Keyword = { link = "Statement" },
		Label = { fg = cs.fg },
		Macro = { link = "PreProc" },
		Number = { fg = cs.syntax_constant },
		Operator = { fg = cs.syntax_symbols, style = "bold" },
		PreCondit = { link = "PreProc" },
		Repeat = { link = "Statement" },
		Special = { fg = cs.fg },
		SpecialChar = { link = "Character" },
		SpecialComment = { fg = cs.fg },
		Statement = { fg = cs.syntax_control, style = "bold" },
		StorageClass = { link = "Type" },
		String = { fg = cs.syntax_string },
		Structure = { link = "Type" },
		Tag = { fg = cs.fg, style = "bold" },
		Todo = { fg = cs.bg, bg = cs.highlight },
		Typedef = { link = "Type" },

		-- Quickfix list
		qfFileName = { fg = cs.fg, style = "italic" },

		-- Netrw
		netrwDir = { link = "Directory" },
		netrwPlain = { fg = cs.fg },
		netrwHdr = { link = "netrwPlain" },
		netrwLex = { link = "netrwPlain" },
		netrwYacc = { link = "netrwPlain" },
		netrwComment = { link = "Comment" },
		netrwHide = { link = "netrwComment" },
		netrwHideSep = { link = "netrwComment" },
		netrwComma = { link = "netrwComment" },
		netrwHelpCmd = { fg = cs.highlight, style = "bold" },
		netrwCmdNote = { fg = cs.highlight },
		netrwClassify = { link = "Function" }, -- Directory trailing slash
		netrwLink = { link = "netrwClassify" },
		netrwSymLink = { link = "netrwClassify" },
		netrwVersion = { link = "Identifier" },
		netrwExe = { link = "PreProc" },
		netrwDateSep = { link = "Delimiter" },
		netrwTreeBar = { link = "Special" },
		netrwHidePat = { link = "Statement" },
		netrwList = { link = "Statement" },
		netrwQHTopic = { link = "Number" },
		netrwCmdSep = { link = "Delimiter" },
		netrwMarkFile = { link = "TabLineSel" },
		netrwCoreDump = { link = "WarningMsg" },
		netrwData = { link = "Folded" },
		netrwLib = { link = "DiffChange" },
		netrwMakefile = { link = "DiffChange" },
		netrwPix = { link = "Special" },
		netrwTimeSep = { link = "netrwDateSep" },
		netrwGray = { link = "Folded" },
		netrwBak = { link = "netrwGray" },
		netrwCompress = { link = "netrwGray" },
		netrwSpecFile = { link = "netrwGray" },
		netrwObj = { link = "netrwGray" },
		netrwTags = { link = "netrwGray" },
		netrwTilde = { link = "netrwGray" },
		netrwTmp = { link = "netrwGray" },

		-- LSP References
		LspReferenceText = { bg = cs.elevation.up2 },
		LspReferenceRead = { bg = cs.elevation.up2 },
		LspReferenceWrite = { bg = cs.elevation.up2 },

		-- Diagnostics
		DiagnosticError = { fg = cs.failure },
		DiagnosticWarn = { fg = cs.warning },
		DiagnosticInfo = { fg = cs.info },
		DiagnosticHint = { fg = cs.info },
		DiagnosticSignError = {
			fg = cs.failure,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		DiagnosticSignWarn = {
			fg = cs.warning,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		DiagnosticSignInfo = {
			fg = cs.info,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		DiagnosticSignHint = {
			fg = cs.info,
			bg = config.colored_columns and cs.elevation.up1 or cs.none,
		},
		DiagnosticUnderlineError = { style = "underline", sp = cs.failure },
		DiagnosticUnderlineWarn = { style = "underline", sp = cs.warning },
		DiagnosticUnderlineInfo = { style = "underline", sp = cs.info },
		DiagnosticUnderlineHint = { style = "underline", sp = cs.info },
		DiagnosticVirtualTextError = { fg = cs.failure, style = "italic" },
		DiagnosticVirtualTextWarn = { fg = cs.warning, style = "italic" },
		DiagnosticVirtualTextInfo = { fg = cs.info, style = "italic" },
		DiagnosticVirtualTextHint = { fg = cs.info, style = "italic" },

		-- Copilot Suggestion
		CopilotSuggestion = { link = "Comment" },

		-- CMP Completion engine
		CmpItemAbbr = { fg = cs.fg },
		CmpItemAbbrDeprecated = { fg = cs.failure, sp = cs.failure, style = "undercurl" },
		CmpItemAbbrMatch = { fg = cs.highlight },
		CmpItemAbbrMatchFuzzy = { fg = cs.highlight },
		CmpItemKind = { fg = cs.dimmed },
		CmpItemMenu = { fg = cs.dimmed },
		CmpItemKindText = { link = "CmpItemKind" },
		CmpItemKindMethod = { link = "Function" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindConstructor = { link = "CmpItemKind" },
		CmpItemKindField = { link = "Label" },
		CmpItemKindVariable = { link = "Identifier" },
		CmpItemKindClass = { link = "Type" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindModule = { link = "PreProc" },
		CmpItemKindProperty = { link = "Label" },
		CmpItemKindUnit = { link = "Constant" },
		CmpItemKindValue = { link = "CmpItemKind" },
		CmpItemKindEnum = { link = "Type" },
		CmpItemKindKeyword = { link = "Keyword" },
		CmpItemKindSnippet = { link = "CmpItemKind" },
		CmpItemKindColor = { link = "CmpItemKind" },
		CmpItemKindFile = { link = "netrwPlain" },
		CmpItemKindReference = { link = "CmpItemKind" },
		CmpItemKindFolder = { link = "netrwDir" },
		CmpItemKindEnumMember = { link = "Type" },
		CmpItemKindConstant = { link = "Constant" },
		CmpItemKindStruct = { link = "Structure" },
		CmpItemKindEvent = { link = "CmpItemKind" },
		CmpItemKindOperator = { link = "Operator" },
		CmpItemKindTypeParameter = { link = "Identifier" },

		-- TODO: *CmpItemKind%KIND_NAME%*
		--   The kind field's highlight group for specific `lsp.CompletionItemKind`.
		--   If you want to overwrite only the method kind's highlight group, you can do this.
		--      Example: highlight CmpItemKindMethod guibg=NONE guifg=Orange

		-- GitSigns
		GitSignsAdd = { fg = cs.success, bg = config.colored_columns and cs.elevation.up1 or cs.none },
		GitSignsChange = { fg = cs.warning, bg = config.colored_columns and cs.elevation.up1 or cs.none },
		GitSignsDelete = { fg = cs.failure, bg = config.colored_columns and cs.elevation.up1 or cs.none },

		-- TODO: LSP Saga
		-- theme.lspsaga = {}

		-- TODO: GitGutter
		-- theme.gitgutter = {}

		-- TODO: Neogit
		-- theme.neogit = {}

		-- Trouble
		TroubleNormal = { link = "Normal" },
		TroubleFoldIcon = { fg = cs.dimmed, style = "bold" },
		TroubleSignInformation = { link = "DiagnosticSignInfo" },
		TroubleSignOther = { link = "TroubleSignInformation" },
		TroubleLocation = { link = "Normal" },
		TroubleCount = { fg = cs.fg, style = "bold" },
		TroubleText = { link = "None" },
		TroubleTextError = { link = "DiagnosticError" },
		TroubleTextWarning = { link = "DiagnosticWarn" },
		TroubleTextInformation = { link = "DiagnosticInfo" },
		TroubleTextHint = { link = "DiagnosticHint" },
		TroublePreview = { link = "Search" },
		TroubleSource = { link = "Comment" },
		TroubleFile = { link = "Normal" },
		TroubleIndent = { link = "Comment" },
		TroubleCode = { link = "Comment" },
		TroubleOther = { link = "DiagnosticOther" },
		TroubleError = { link = "DiagnosticError" },
		TroubleSignError = { link = "DiagnosticSignError" },
		TroubleWarning = { link = "DiagnosticWarn" },
		TroubleSignWarning = { link = "DiagnosticSignWarn" },
		TroubleInformation = { link = "DiagnosticInfo" },
		TroubleHint = { link = "DiagnosticHint" },
		TroubleSignHint = { link = "DiagnosticSignHint" },

		-- Indent blankline
		IndentBlanklineSpaceCharBlankline = { style = "nocombine" },
		IndentBlanklineContextChar = { fg = cs.highlight, style = "nocombine" },
		IndentBlanklineChar = { fg = cs.dimmed, style = "nocombine" }, -- TODO: use general group
		IndentBlanklineSpaceChar = { style = "nocombine" },
		IndentBlanklineContextStart = { style = "underline", sp = cs.highlight },

		-- TODO: Feline
		-- theme.lualine = {}

		-- TODO: Nvim Tree
		-- theme.nvim_tree = {}

		-- Whichkey
		WhichKey = { fg = cs.highlight, style = "bold" }, -- Function	the key
		WhichKeyGroup = { fg = cs.fg }, --Keyword	a group
		WhichKeySeparator = { fg = cs.dimmed }, --	DiffAdded	the separator between the key and its label
		WhichKeyDesc = { fg = cs.fg }, -- Identifier	the label of the key
		WhichKeyFloat = { link = "Float" }, -- NormalFloat	Normal in the popup window
		WhichKeyValue = { fg = cs.fg }, -- Comment	used by plugins that provide values

		-- Telescope
		TelescopeSelection = { fg = cs.highlight, bg = cs.elevation.up2, style = "bold" },
		TelescopeSelectionCaret = { fg = cs.highlight, style = "bold" },
		TelescopeMultiSelection = { fg = cs.highlight, style = "italic" },
		TelescopeMultiIcon = { fg = cs.highlight, style = "bold" },
		TelescopeNormal = { link = "Normal" },
		TelescopeBorder = { fg = cs.elevation.up1 },
		TelescopeTitle = { fg = cs.fg },
		TelescopePromptCounter = { fg = cs.dimmed },
		TelescopeMatching = { fg = cs.highlight, style = "bold" },
		TelescopePromptPrefix = { fg = cs.dimmed, style = "bold" },

		-- FZF
		FZFBorder = { fg = cs.elevation.up1 },
		FZFForeground = { fg = cs.fg },
		FZFForegroundPlus = { fg = cs.highlight, style = "bold" }, -- fg = selected result
		FZFHeader = { bg = cs.fg },
		FZFHighlight = { fg = cs.highlight, bg = cs.bg },
		FZFHighlightPlus = { fg = cs.highlight, bg = cs.bg, style = "bold" }, -- fg = fuzzy match in selected result
		FZFInfo = { fg = cs.success },
		FZFMarker = { fg = cs.highlight },
		FZFPointer = { fg = cs.highlight },
		FZFPrompt = { fg = cs.fg },
		FZFSpinner = { fg = cs.fg },

		-- Treesitter
		TSAttribute = { link = "None" },
		TSBoolean = { link = "Boolean" },
		TSCharacter = { link = "Character" },
		TSComment = { link = "Comment" },
		TSConditional = { link = "Conditional" },
		TSConstant = { link = "Constant" },
		TSConstBuiltin = { link = "Constant" },
		TSConstMacro = { link = "Constant" },
		TSConstructor = { link = "None" },
		TSError = { link = "Error" },
		TSException = { link = "Exception" },
		TSField = { link = "Label" },
		TSFloat = { link = "Float" },
		TSFunction = { link = "Function" },
		TSFuncBuiltin = { link = "Function" },
		TSFuncMacro = { link = "Function" },
		TSInclude = { link = "Include" },
		TSKeyword = { link = "Keyword" },
		TSKeywordFunction = { link = "Function" },
		TSKeywordOperator = { link = "Operator" },
		TSKeywordReturn = { link = "Keyword" },
		TSLabel = { link = "Label" },
		TSMethod = { link = "Function" },
		TSNamespace = { link = "Identifier" },
		TSNone = { link = "None" },
		TSNumber = { link = "Number" },
		TSOperator = { link = "Operator" },
		TSParameter = { link = "Identifier" },
		TSParameterReference = { link = "Identifier" },
		TSProperty = { link = "Label" },
		TSPunctDelimiter = { link = "Delimiter" },
		TSPunctBracket = { link = "Delimiter" },
		TSPunctSpecial = { link = "Delimiter" },
		TSRepeat = { link = "Repeat" },
		TSString = { link = "String" },
		TSStringRegex = { link = "Character" },
		TSStringEscape = { link = "Charater" },
		TSSymbol = { link = "Identifier" },
		TSTag = { link = "Tag" },
		TSTagAttribute = { link = "Identifier" },
		TSTagDelimiter = { link = "Delimiter" },
		TSText = { link = "None" },
		TSStrong = { link = "Strong" },
		TSEmphasis = { link = "Emphasis" },
		TSUnderline = { link = "Underline" },
		TSStrike = { link = "None" },
		TSTitle = { link = "Title" },
		TSLiteral = { link = "None" },
		TSURI = { link = "None" },
		TSMath = { link = "None" },
		TSTextReference = { link = "None" },
		TSEnviroment = { link = "None" },
		TSEnviromentName = { link = "None" },
		TSNote = { link = "Todo" },
		TSWarning = { link = "WarningMsg" },
		TSDanger = { link = "ErrorMsg" },
		TSType = { link = "Type" },
		TSTypeBuiltin = { link = "Type" },
		TSVariable = { link = "Identifier" },
		TSVariableBuiltin = { link = "Keyword" },
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
