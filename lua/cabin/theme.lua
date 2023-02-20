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
	local cs = config.colors

	theme = {
		ColorColumn = { bg = cs.red_darker },
		Conceal = {},
		Cursor = {},
		CursorColumn = {},
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = cs.shade_dark2 },
		CursorLineNr = {},
		DiffAdd = { bg = cs.green_darker },
		DiffChange = {},
		DiffDelete = { bg = cs.red_darker },
		DiffText = { bg = cs.blue_darker },
		Directory = { bold = true },
		EndOfBuffer = { link = "NonText" },
		ErrorMsg = { fg = cs.shade_light3, bg = cs.red_medium, bold = true },
		FoldColumn = { link = "Folded" },
		Folded = { fg = cs.shade_light5, bg = cs.shade_dark2 },
		IncSearch = { fg = cs.shade_dark1, bg = cs.yellow_light },
		LineNr = { fg = cs.yellow_light },
		LineNrAbove = { link = "LineNr" },
		LineNrBelow = { link = "LineNr" },
		MatchParen = { underline = true },
		ModeMsg = { fg = cs.yellow_light, bold = true },
		MoreMsg = { fg = cs.green_medium, bold = true },
		MsgArea = { link = "Normal" },
		MsgSeparator = { link = "MoreMsg" },
		NonText = { link = "Normal" },
		Normal = { fg = cs.shade_light3, bg = cs.shade_dark1 },
		NormalFloat = { bg = cs.shade_dark3 },
		NormalNC = { link = "Normal" },
		Pmenu = { link = "NormalFloat" },
		PmenuSbar = { link = "NormalFloat" },
		PmenuSel = { fg = cs.shade_dark3, bg = cs.yellow_light },
		PmenuThumb = { bg = cs.shade_dark4 },
		Question = { fg = cs.green_medium },
		QuickFixLine = { fg = cs.shade_dark1, bg = cs.green_medium },
		Search = { fg = cs.shade_dark1, bg = cs.yellow_light },
		SignColumn = { bg = cs.shade_dark2 },
		SpecialKey = {},
		SpellBad = { undercurl = true },
		SpellCap = { undercurl = true },
		SpellLocal = { undercurl = true },
		SpellRare = { undercurl = true },
		StatusLine = { fg = cs.shade_dark1, bg = cs.shade_light3 },
		StatusLineNC = { link = "NormalFloat" },
		Substitute = { link = "Search" },
		TabLine = {},
		TabLineFill = {},
		TabLineSel = {},
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		Title = {},
		VertSplit = { link = "Normal" },
		Visual = { bg = cs.shade_dark4 },
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = cs.shade_dark1, bg = cs.yellow_light },
		Whitespace = { link = "NonText" },
		WildMenu = { fg = cs.shade_dark1, bg = cs.yellow_light },
		lCursor = { link = "Cursor" },

		Comment = { fg = cs.cyan_medium, italic = true }, -- any comment (perfered group)

		Constant = {}, -- any constant (perferred group)
		String = { fg = cs.green_medium }, --  a string constant: "this is a string"
		Character = { fg = cs.green_dark, italic = true }, --  a character constant: 'c', '\n'
		Number = { fg = cs.magenta_medium }, --  a number constant: 234, 0xff
		Boolean = { fg = cs.magenta_medium }, --  a boolean constant: TRUE, false
		Float = { link = "Number" }, --  a floating point constant: 2.3e10

		Identifier = {}, -- any variable name (perferred group)
		Function = { fg = cs.yellow_light, bold = true }, --  function name (also: methods for classes)

		Statement = { fg = cs.orange_medium, bold = true }, -- any statement (perferred group)
		Conditional = { link = "Statement" }, -- if, then, else, endif, switch, etc.
		Repeat = { link = "Statement" }, -- for, do, while, etc.
		Label = {}, --  case, default, etc.
		Operator = { link = "Statement" }, --  "sizeof", "+", "*", etc.
		Keyword = { link = "Statement" }, -- any other keyword
		Exception = { link = "Statement" }, -- try, catch, throw

		PreProc = { fg = cs.magenta_dark }, -- generic Preprocessor (perferred group)
		Include = { link = "PreProc" }, --  preprocessor #include
		Define = { link = "PreProc" }, --  preprocessor #define
		Macro = { link = "PreProc" }, --  same as Define
		PreCondit = { link = "PreProc" }, --  preprocessor #if, #else, #endif, etc.

		Type = { fg = cs.cyan_light }, -- int, long, char, etc. (perferred group)
		StorageClass = { link = "Type" }, --  static, register, volatile, etc.
		Structure = { link = "Type" }, --  struct, union, enum, etc.
		Typedef = { link = "Type" }, --  A typedef

		Special = {}, -- any special symbol (perferred group)
		SpecialChar = { link = "Charater" }, --  special character in a constant
		Tag = { bold = true }, --  you can use CTRL-] on this
		Delimiter = { link = "Special" }, --  character that needs attention
		SpecialComment = { link = "Special" }, --  special things inside a comment
		Debug = { link = "Special" }, --  debugging statements

		Underlined = { underline = true }, -- text that stands out, HTML links (perferred group)

		Ignore = {}, -- left blank, hidden  |hl-Ignore| (perferred group)

		Error = { underline = true, sp = cs.red_medium }, -- any erroneous construct (perferred group)

		Todo = { fg = cs.shade_dark3, bg = cs.yellow_light }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Diagnostics
		DiagnosticError = { fg = cs.red_light, bg = cs.red_darker },
		DiagnosticWarn = { fg = cs.yellow_light, bg = cs.yellow_darker },
		DiagnosticInfo = { fg = cs.blue_light, bg = cs.blue_darker },
		DiagnosticHint = { fg = cs.green_light, bg = cs.green_darker },
		-- DiagnosticSignError = {},
		-- DiagnosticSignWarn = {},
		-- DiagnosticSignInfo = {},
		-- DiagnosticSignHint = {},
		-- DiagnosticUnderlineError = {},
		-- DiagnosticUnderlineWarn = {},
		-- DiagnosticUnderlineInfo = {},
		-- DiagnosticUnderlineHint = {},
		-- DiagnosticVirtualTextError = {},
		-- DiagnosticVirtualTextWarn = {},
		-- DiagnosticVirtualTextInfo = {},
		-- DiagnosticVirtualTextHint = {},

		-- GitSigns
		GitSignsAdd = { fg = cs.green_light, bg = cs.shade_dark2 },
		GitSignsChange = { fg = cs.blue_light, bg = cs.shade_dark2 },
		GitSignsDelete = { fg = cs.red_light, bg = cs.shade_dark2 },

		-- Quickfix list
		-- qfFileName = {},

		-- LSP References
		-- LspReferenceText = { bg = cs.elevation.up2 },
		-- LspReferenceRead = { bg = cs.elevation.up2 },
		-- LspReferenceWrite = { bg = cs.elevation.up2 },

		-- CMP Completion engine
		-- CmpItemAbbr = { fg = cs.fg },
		-- CmpItemAbbrDeprecated = { fg = cs.failure, sp = cs.failure, undercurl = true },
		-- CmpItemAbbrMatch = { fg = cs.highlight },
		-- CmpItemAbbrMatchFuzzy = { fg = cs.highlight },
		-- CmpItemKind = { fg = cs.dimmed },
		-- CmpItemMenu = { fg = cs.dimmed },
		-- CmpItemKindText = { link = "CmpItemKind" },
		-- CmpItemKindMethod = { link = "Function" },
		-- CmpItemKindFunction = { link = "Function" },
		-- CmpItemKindConstructor = { link = "CmpItemKind" },
		-- CmpItemKindField = { link = "Label" },
		-- CmpItemKindVariable = { link = "Identifier" },
		-- CmpItemKindClass = { link = "Type" },
		-- CmpItemKindInterface = { link = "Type" },
		-- CmpItemKindModule = { link = "PreProc" },
		-- CmpItemKindProperty = { link = "Label" },
		-- CmpItemKindUnit = { link = "Constant" },
		-- CmpItemKindValue = { link = "CmpItemKind" },
		-- CmpItemKindEnum = { link = "Type" },
		-- CmpItemKindKeyword = { link = "Keyword" },
		-- CmpItemKindSnippet = { link = "CmpItemKind" },
		-- CmpItemKindColor = { link = "CmpItemKind" },
		-- CmpItemKindFile = { link = "netrwPlain" },
		-- CmpItemKindReference = { link = "CmpItemKind" },
		-- CmpItemKindFolder = { link = "netrwDir" },
		-- CmpItemKindEnumMember = { link = "Type" },
		-- CmpItemKindConstant = { link = "Constant" },
		-- CmpItemKindStruct = { link = "Structure" },
		-- CmpItemKindEvent = { link = "CmpItemKind" },
		-- CmpItemKindOperator = { link = "Operator" },
		-- CmpItemKindTypeParameter = { link = "Identifier" },

		-- TODO: *CmpItemKind%KIND_NAME%*
		--   The kind field's highlight group for specific `lsp.CompletionItemKind`.
		--   If you want to overwrite only the method kind's highlight group, you can do this.
		--      Example: highlight CmpItemKindMethod guibg=NONE guifg=Orange

		-- Trouble
		-- TroubleNormal = { link = "Normal" },
		-- TroubleFoldIcon = { fg = cs.dimmed, bold = true },
		-- TroubleSignInformation = { link = "DiagnosticSignInfo" },
		-- TroubleSignOther = { link = "TroubleSignInformation" },
		-- TroubleLocation = { link = "Normal" },
		-- TroubleCount = { fg = cs.fg, bold = true },
		-- TroubleText = { link = "None" },
		-- TroubleTextError = { link = "DiagnosticError" },
		-- TroubleTextWarning = { link = "DiagnosticWarn" },
		-- TroubleTextInformation = { link = "DiagnosticInfo" },
		-- TroubleTextHint = { link = "DiagnosticHint" },
		-- TroublePreview = { link = "Search" },
		-- TroubleSource = { link = "Comment" },
		-- TroubleFile = { link = "Normal" },
		-- TroubleIndent = { link = "Comment" },
		-- TroubleCode = { link = "Comment" },
		-- TroubleOther = { link = "DiagnosticOther" },
		-- TroubleError = { link = "DiagnosticError" },
		-- TroubleSignError = { link = "DiagnosticSignError" },
		-- TroubleWarning = { link = "DiagnosticWarn" },
		-- TroubleSignWarning = { link = "DiagnosticSignWarn" },
		-- TroubleInformation = { link = "DiagnosticInfo" },
		-- TroubleHint = { link = "DiagnosticHint" },
		-- TroubleSignHint = { link = "DiagnosticSignHint" },

		-- Indent blankline
		-- IndentBlanklineSpaceCharBlankline = { nocombine = true },
		-- IndentBlanklineContextChar = { fg = cs.highlight, nocombine = true },
		-- IndentBlanklineChar = { fg = cs.dimmed, nocombine = true }, -- TODO: use general group
		-- IndentBlanklineSpaceChar = { nocombine = true },
		-- IndentBlanklineContextStart = { underline = true, sp = cs.highlight },

		-- TODO: Feline
		-- theme.lualine = {}

		-- TODO: Nvim Tree
		-- theme.nvim_tree = {}

		-- Whichkey
		-- WhichKey = { fg = cs.highlight, bold = true }, -- Function	the key
		-- WhichKeyGroup = { fg = cs.fg }, --Keyword	a group
		-- WhichKeySeparator = { fg = cs.dimmed }, --	DiffAdded	the separator between the key and its label
		-- WhichKeyDesc = { fg = cs.fg }, -- Identifier	the label of the key
		-- WhichKeyFloat = { link = "Float" }, -- NormalFloat	Normal in the popup window
		-- WhichKeyValue = { fg = cs.fg }, -- Comment	used by plugins that provide values

		-- Telescope
		-- TelescopeSelection = { fg = cs.highlight, bg = cs.elevation.up2, bold = true },
		-- TelescopeSelectionCaret = { fg = cs.highlight, bold = true },
		-- TelescopeMultiSelection = { fg = cs.highlight, italic = true },
		-- TelescopeMultiIcon = { fg = cs.highlight, bold = true },
		-- TelescopeNormal = { link = "Normal" },
		-- TelescopeBorder = { fg = cs.elevation.up1 },
		-- TelescopeTitle = { fg = cs.fg },
		-- TelescopePromptCounter = { fg = cs.dimmed },
		-- TelescopeMatching = { fg = cs.highlight, bold = true },
		-- TelescopePromptPrefix = { fg = cs.dimmed, bold = true },

		-- FZF
		-- FZFBorder = { fg = cs.elevation.up1 },
		-- FZFForeground = { fg = cs.fg },
		-- FZFForegroundPlus = { fg = cs.highlight, bold = true }, -- fg = selected result
		-- FZFHeader = { bg = cs.fg },
		-- FZFHighlight = { fg = cs.highlight, bg = cs.bg },
		-- FZFHighlightPlus = { fg = cs.highlight, bg = cs.bg, bold = true }, -- fg = fuzzy match in selected result
		-- FZFInfo = { fg = cs.success },
		-- FZFMarker = { fg = cs.highlight },
		-- FZFPointer = { fg = cs.highlight },
		-- FZFPrompt = { fg = cs.fg },
		-- FZFSpinner = { fg = cs.fg },

		-- Treesitter
		-- TSAttribute = { link = "None" },
		-- TSBoolean = { link = "Boolean" },
		-- TSCharacter = { link = "Character" },
		-- TSComment = { link = "Comment" },
		-- TSConditional = { link = "Conditional" },
		-- TSConstant = { link = "Constant" },
		-- TSConstBuiltin = { link = "Constant" },
		-- TSConstMacro = { link = "Constant" },
		-- TSConstructor = { link = "None" },
		-- TSError = { link = "Error" },
		-- TSException = { link = "Exception" },
		-- TSField = { link = "Label" },
		-- TSFloat = { link = "Float" },
		-- TSFunction = { link = "Function" },
		-- TSFuncBuiltin = { link = "Function" },
		-- TSFuncMacro = { link = "Function" },
		-- TSInclude = { link = "Include" },
		-- TSKeyword = { link = "Keyword" },
		-- TSKeywordFunction = { link = "Function" },
		-- TSKeywordOperator = { link = "Operator" },
		-- TSKeywordReturn = { link = "Keyword" },
		-- TSLabel = { link = "Label" },
		-- TSMethod = { link = "Function" },
		-- TSNamespace = { link = "Identifier" },
		-- TSNone = { link = "None" },
		-- TSNumber = { link = "Number" },
		-- TSOperator = { link = "Operator" },
		-- TSParameter = { link = "Identifier" },
		-- TSParameterReference = { link = "Identifier" },
		-- TSProperty = { link = "Label" },
		-- TSPunctDelimiter = { link = "Delimiter" },
		-- TSPunctBracket = { link = "Delimiter" },
		-- TSPunctSpecial = { link = "Delimiter" },
		-- TSRepeat = { link = "Repeat" },
		-- TSString = { link = "String" },
		-- TSStringRegex = { link = "Character" },
		-- TSStringEscape = { link = "Charater" },
		-- TSSymbol = { link = "Identifier" },
		-- TSTag = { link = "Tag" },
		-- TSTagAttribute = { link = "Identifier" },
		-- TSTagDelimiter = { link = "Delimiter" },
		-- TSText = { link = "None" },
		-- TSStrong = { link = "Strong" },
		-- TSEmphasis = { link = "Emphasis" },
		-- TSUnderline = { link = "Underline" },
		-- TSStrike = { link = "None" },
		-- TSTitle = { link = "Title" },
		-- TSLiteral = { link = "None" },
		-- TSURI = { link = "None" },
		-- TSMath = { link = "None" },
		-- TSTextReference = { link = "None" },
		-- TSEnviroment = { link = "None" },
		-- TSEnviromentName = { link = "None" },
		-- TSNote = { link = "Todo" },
		-- TSWarning = { link = "WarningMsg" },
		-- TSDanger = { link = "ErrorMsg" },
		-- TSType = { link = "Type" },
		-- TSTypeBuiltin = { link = "Type" },
		-- TSVariable = { link = "Identifier" },
		-- TSVariableBuiltin = { link = "Keyword" },
	}

	-- Fzf
	-- TODO: Move FZF global var somewhere more obvious
	-- vim.g.fzf_colors = {
	-- 	fg = { "fg", "FZFForeground" },
	-- 	bg = { "bg", "FZFHighlight" },
	-- 	hl = { "fg", "FZFHighlight" },
	-- 	["fg+"] = { "fg", "FZFForegroundPlus" },
	-- 	["bg+"] = { "bg", "FZFHighlightPlus" },
	-- 	["hl+"] = { "fg", "FZFHighlightPlus" },
	-- 	info = { "fg", "FZFInfo" },
	-- 	border = { "fg", "FZFBorder" },
	-- 	prompt = { "fg", "FZFPrompt" },
	-- 	pointer = { "fg", "FZFPointer" },
	-- 	marker = { "fg", "FZFMarker" },
	-- 	spinner = { "fg", "FZFSpinner" },
	-- 	header = { "fg", "FZFHeader" },
	-- }

	return theme
end

return M
