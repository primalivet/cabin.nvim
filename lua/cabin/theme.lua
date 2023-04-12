local M = {}
-- HiGroup {
--   name: String,
--   link?: String (GroupName)
--   fg: String (HEX)
--   bg: String (HEX)
--   style: String (Bold,Italics,Reverse)
-- }

function M.setup(config)
	local cs = config.colors

	local theme = {
		normal = {
			fg = cs.grey300,
			bg = cs.grey900,
		},
		float = {
			fg = cs.grey300,
			bg = cs.grey800,
		},
		status = {
			fg = cs.grey300,
			bg = cs.grey700,
		},
		vcs = {
			add = { fg = cs.green500 },
			remove = { fg = cs.red500 },
			change = { fg = cs.blue500 },
		},
		diff = {
			add = { bg = cs.green900 },
			remove = { bg = cs.red900 },
			change = { bg = cs.blue900 },
		},
		visual = {
			bg = cs.yellow800,
		},
		numbers = {
			fg = cs.yellow500,
		},
		semantic = {
			success = {
				fg = cs.grey100,
				bg = cs.green900,
			},
			info = {
				fg = cs.grey100,
				bg = cs.blue900,
			},
			warn = {
				fg = cs.grey100,
				bg = cs.yellow900,
			},
			error = {
				fg = cs.grey100,
				bg = cs.red900,
			},
		},
		diagnostic = {
			info = {
				fg = cs.blue400,
				bg = cs.blue900,
			},
			hint = {
				fg = cs.green400,
				bg = cs.green900,
			},
			warn = {
				fg = cs.yellow400,
				bg = cs.yellow900,
			},
			error = {
				fg = cs.red400,
				bg = cs.red900,
			},
		},
		search = {
			bg = cs.yellow800,
		},
		pmenu = {
			fg = cs.grey300,
			bg = cs.grey700,
		},
		wildmenu = {
			fg = cs.grey900,
			bg = cs.yellow500,
		},
		qf = {
			fg = cs.grey900,
			bg = cs.green500,
		},
		syntax = {
			-- Comment
			comment = { fg = cs.cyan800 },
			-- Constant
			constant = { fg = cs.none },
			string = { fg = cs.green500 },
			char = { fg = cs.green700 },
			number = { fg = cs.magenta800 },
			-- Identifier
			identifier = { fg = cs.none },
			fn = { fg = cs.yellow400 },
			-- Statement
			statement = { fg = cs.orange500 },
			label = { fg = cs.none },
			-- PreProc
			preproc = { fg = cs.magenta300 },
			-- Type
			type = { fg = cs.cyan700 },
			-- Special
			special = { fg = cs.none },
			tag = { fg = cs.none },
		},
	}

	local highlights = {
		ColorColumn = theme.semantic.error,
		Conceal = {},
		Cursor = {},
		CursorColumn = {},
		CursorIM = { link = "Cursor" },
		CursorLine = {},
		CursorLineNr = {},
		DiffAdd = theme.diff.add,
		DiffChange = {},
		DiffDelete = theme.diff.remove,
		DiffText = theme.diff.change,
		Directory = { bold = true },
		EndOfBuffer = { link = "NonText" },
		ErrorMsg = vim.tbl_extend("force", theme.semantic.error, { bold = true }),
		FoldColumn = { link = "Folded" },
		Folded = {},
		IncSearch = theme.search,
		LineNr = theme.numbers,
		LineNrAbove = { link = "LineNr" },
		LineNrBelow = { link = "LineNr" },
		MatchParen = { underline = true },
		ModeMsg = { bold = true },
		MoreMsg = {},
		MsgArea = { link = "Normal" },
		MsgSeparator = { link = "MoreMsg" },
		NonText = { link = "Normal" },
		Normal = theme.normal,
		NormalFloat = theme.float,
		NormalNC = { link = "Normal" },
		Pmenu = theme.pmenu,
		PmenuSbar = { link = "Pmenu" },
		PmenuSel = theme.wildmenu,
		PmenuThumb = { link = "NormalFloat" },
		Question = theme.semantic.success,
		QuickFixLine = theme.qf,
		Search = theme.search,
		SignColumn = {},
		SpecialKey = {},
		SpellBad = { undercurl = true },
		SpellCap = { undercurl = true },
		SpellLocal = { undercurl = true },
		SpellRare = { undercurl = true },
		StatusLine = theme.status,
		StatusLineNC = { link = "NormalFloat" },
		Substitute = { link = "Search" },
		TabLine = {},
		TabLineFill = {},
		TabLineSel = {},
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		Title = {},
		VertSplit = { link = "Normal" },
		Visual = theme.visual,
		VisualNOS = { link = "Visual" },
		WarningMsg = theme.semantic.warn,
		Whitespace = { link = "NonText" },
		WildMenu = theme.wildmenu,
		lCursor = { link = "Cursor" },

		-- Builtin highlight groups

		Comment = vim.tbl_extend("force", theme.syntax.comment, { italic = true }), -- any comment (perfered group)

		Constant = theme.status.constant, -- any constant (perferred group)
		String = theme.syntax.string, --  a string constant: "this is a string"
		Character = vim.tbl_extend("force", theme.syntax.char, { italic = true }), --  a character constant: 'c', '\n'
		Number = theme.syntax.number, --  a number constant: 234, 0xff
		Boolean = { link = "Constant" }, --  a boolean constant: TRUE, false
		Float = { link = "Number" }, --  a floating point constant: 2.3e10

		Identifier = theme.syntax.identifier, -- any variable name (perferred group)
		Function = vim.tbl_extend("force", theme.syntax.fn, { bold = true }), --  function name (also: methods for classes)

		Statement = vim.tbl_extend("force", theme.syntax.statement, { bold = true }), -- any statement (perferred group)
		Conditional = { link = "Statement" }, -- if, then, else, endif, switch, etc.
		Repeat = { link = "Statement" }, -- for, do, while, etc.
		Label = theme.syntax.label, --  case, default, etc.
		Operator = { link = "Statement" }, --  "sizeof", "+", "*", etc.
		Keyword = { link = "Statement" }, -- any other keyword
		Exception = { link = "Statement" }, -- try, catch, throw

		PreProc = theme.syntax.preproc, -- generic Preprocessor (perferred group)
		Include = { link = "PreProc" }, --  preprocessor #include
		Define = { link = "PreProc" }, --  preprocessor #define
		Macro = { link = "PreProc" }, --  same as Define
		PreCondit = { link = "PreProc" }, --  preprocessor #if, #else, #endif, etc.

		Type = theme.syntax.type, -- int, long, char, etc. (perferred group)
		StorageClass = { link = "Type" }, --  static, register, volatile, etc.
		Structure = { link = "Type" }, --  struct, union, enum, etc.
		Typedef = { link = "Type" }, --  A typedef

		Special = theme.syntax.special, -- any special symbol (perferred group)
		SpecialChar = { link = "Charater" }, --  special character in a constant
		Tag = vim.tbl_extend("force", theme.syntax.tag, { bold = true }), --  you can use CTRL-] on this
		Delimiter = { link = "Special" }, --  character that needs attention
		SpecialComment = { link = "Special" }, --  special things inside a comment
		Debug = { link = "Special" }, --  debugging statements

		Underlined = { underline = true }, -- text that stands out, HTML links (perferred group)
		Ignore = {}, -- left blank, hidden  |hl-Ignore| (perferred group)
		Error = { underline = true, sp = theme.semantic.error.bg }, -- any erroneous construct (perferred group)
		Todo = theme.semantic.warn, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Diagnostics

		DiagnosticError = theme.diagnostic.error,
		DiagnosticWarn = theme.diagnostic.warn,
		DiagnosticInfo = theme.diagnostic.info,
		DiagnosticHint = theme.diagnostic.hint,
		DiagnosticSignError ={ fg = theme.diagnostic.error.fg },
		DiagnosticSignWarn = { fg = theme.diagnostic.warn.fg },
		DiagnosticSignInfo = { fg = theme.diagnostic.info.fg },
		DiagnosticSignHint = { fg = theme.diagnostic.hint.fg },
		-- DiagnosticUnderlineError = {},
		-- DiagnosticUnderlineWarn = {},
		-- DiagnosticUnderlineInfo = {},
		-- DiagnosticUnderlineHint = {},
		-- DiagnosticVirtualTextError ={},
		-- DiagnosticVirtualTextWarn = {},
		-- DiagnosticVirtualTextInfo = {},
		-- DiagnosticVirtualTextHint = {},
		DiagnosticFloatingError ={ fg = theme.diagnostic.error.fg },
		DiagnosticFloatingWarn = { fg = theme.diagnostic.warn.fg },
		DiagnosticFloatingInfo = { fg = theme.diagnostic.info.fg },
		DiagnosticFloatingHint = { fg = theme.diagnostic.hint.fg },

		-- Treesitter


		-- GitSigns
		GitSignsAdd = theme.vcs.add,
		GitSignsChange = theme.vcs.change,
		GitSignsDelete = theme.vcs.remove,

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
	}

	return highlights

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
end

return M
