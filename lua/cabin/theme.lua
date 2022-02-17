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
		{ name = "ErrorMsg", fg = cs.red, style = "bold" },
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
		{ name = "PmenuSel", fg = cs.highlight, bg = cs.elevation.up2 },
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

	theme.statusline = {
		{ name = "StatusLineYellowBg", fg = cs.bg, bg = cs.yellow },
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

		{ name = "Constant", fg = cs.red},
		{ name = "String", fg = cs.green },
		{ name = "Character", fg = cs.green, style = "italic" },
		{ name = "Number", fg = cs.red },
		{ name = "Boolean", fg = cs.red },
		{ name = "Float", fg = cs.red },

		{ name = "Identifier", fg = cs.cyan },
		{ name = "Function", fg = cs.yellow, style = "bold" },

		{ name = "Statement", fg = cs.orange },
		{ name = "Conditional", fg = cs.orange },
		{ name = "Repeat", fg = cs.orange },
		{ name = "Label", fg = cs.cyan },
		{ name = "Operator", fg = cs.yellow },
		{ name = "Keyword", fg = cs.orange },
		{ name = "Exception", fg = cs.orange },

		{ name = "PreProc", fg = cs.magentan },
		{ name = "Include", fg = cs.magentan },
		{ name = "Define", fg = cs.magentan },
		{ name = "Macro", fg = cs.magentan },
		{ name = "PreCondit", fg = cs.magentan },

		{ name = "Type", fg = cs.blue },
		{ name = "StorageClass", link = "Type" },
		{ name = "Structure", link = "Type" },
		{ name = "Typedef", link = "Type" },

		{ name = "Special", fg = cs.fg },
		{ name = "SpecialChar", fg = cs.green, style = "italic" },
		{ name = "Tag", fg = cs.cyan },
		{ name = "Delimiter", fg = cs.fg },
		{ name = "SpecialComment", fg = cs.fg },
		{ name = "Debug", fg = cs.fg},

		{ name = "Underlined", style = "underline" },
		{ name = "Ignore" },
		{ name = "Error", fg = cs.fg, bg = cs.red },
		{ name = "Todo", fg = cs.bg, bg = cs.highlight },
	}

	theme.plugins = {
		-- LSP
		{ name = "DiagnosticError", fg = cs.red },
		{ name = "DiagnosticWarn", fg = cs.yellow },
		{ name = "DiagnosticInfo", fg = cs.grey7 },
		{ name = "DiagnosticHint", fg = cs.grey7 },
		{ name = "DiagnosticUnderlineError", style = "underline", sp = cs.red },
		{ name = "DiagnosticUnderlineWarn", style = "underline", sp = cs.yellow },
		{ name = "DiagnosticUnderlineInfo", style = "underline", sp = cs.fg },
		{ name = "DiagnosticUnderlineHint", style = "underline", sp = cs.fg },
		{ name = "DiagnosticVirtualTextError", fg = cs.red, style = "italic" },
		{ name = "DiagnosticVirtualTextWarn", fg = cs.yellow, style = "italic" },
		{ name = "DiagnosticVirtualTextInfo", fg = cs.grey7, style = "italic" },
		{ name = "DiagnosticVirtualTextHint", fg = cs.grey7, style = "italic" },
		-- CMP

		{ name = "CmpItemAbbr", fg = cs.fg },
		{ name = "CmpItemAbbrDeprecated", fg = cs.red, sp = cs.red, style = "undercurl" },
		{ name = "CmpItemAbbrMatch", fg = cs.highlight },
		{ name = "CmpItemAbbrMatchFuzzy", fg = cs.highlight },
		{ name = "CmpItemKind", fg = cs.grey7 },

		-- TODO: Whatis this?
		-- { name = "CmpItemMenu", fg = cs.purple }, The menu field's highlight group.

		-- TODO: *CmpItemKind%KIND_NAME%*
		--   The kind field's highlight group for specific `lsp.CompletionItemKind`.
		--   If you want to overwrite only the method kind's highlight group, you can do this.
		--      Example: highlight CmpItemKindMethod guibg=NONE guifg=Orange

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
		-- Telescope
		{ name = "TelescopeSelection", fg = cs.highlight, bg = cs.bg, style = "bold" },
		{ name = "TelescopeSelectionCaret", fg = cs.bright_pink, style = "bold" },
		{ name = "TelescopeMultiSelection", fg = cs.green, style = "italic" },
		{ name = "TelescopeMultiIcon", fg = cs.green, style = "bold" },
		{ name = "TelescopeNormal", fg = cs.fg, bg = cs.elevation.down1 },
		{ name = "TelescopeBorder", fg = cs.elevation.up1 },
		{ name = "TelescopeTitle", fg = cs.green },
		{ name = "TelescopePromptCounter", fg = cs.green },
		{ name = "TelescopeMatching", fg = cs.highlight, style = "bold" },
		{ name = "TelescopePromptPrefix", fg = cs.pink, style = "bold" },
		-- TODO: Need these?
		-- match FZFBorder //
		--  match FZFForeground //
		--  match FZFHeader //
		--  match FZFHighlight //
		--  match FZFHighlightPlus //
		--  match FZFInfo //
		--  match FZFMarker //
		--  match FZFPointer //
		--  match FZFPrompt //
		--  match FZFSpinner //
		-- TODO: FZF
		{ name = "FZFBorder" },
		{ name = "FZFForeground", fg = cs.red },
		{ name = "FZFForegroundPlus" },
		{ name = "FZFHeader" },
		{ name = "FZFHighlight", fg = cs.highlight },
		{ name = "FZFHighlightPlus" },
		{ name = "FZFInfo" },
		{ name = "FZFMarker" },
		{ name = "FZFPointer" },
		{ name = "FZFPrompt" },
		{ name = "FZFSpinner" },
		-- Treesitter
		-- TODO: Go through these
		--   For C++/Dart attributes, annotations that can be attached to the code to" },
		--   denote some kind of meta information." },
		{ name = "TSAnnotation", link = "None" },
		--   (unstable) TODO: docs" },
		{ name = "TSAttribute", link = "None" },
		--  For booleans." },
		{ name = "TSBoolean", link = "Boolean" },
		--  For characters." },
		{ name = "TSCharacter", link = "Character" },
		--  For comment blocks." },
		{ name = "TSComment", link = "Comment" },
		--  For keywords related to conditionnals." },
		{ name = "TSConditional", link = "Conditional" },
		--  For constants" },
		{ name = "TSConstant", link = "Constant" },
		--  For constant that are built in the language: `nil` in Lua." },
		{ name = "TSConstBuiltin", link = "Constant" },
		--  For constants that are defined by macros: `NULL` in C." },
		{ name = "TSConstMacro", link = "Constant" },
		--  For constructor calls and definitions: `{}` in Lua, and Java constructors." },
		{ name = "TSConstructor", link = "None" },
		--  For syntax/parser errors." },
		{ name = "TSError", link = "Error" },
		--  For exception related keywords." },
		{ name = "TSException", link = "Exception" },
		--  For fields." },
		{ name = "TSField", link = "Normal" },
		--  For floats." },
		{ name = "TSFloat", link = "Float" },
		--  For function (calls and definitions)." },
		{ name = "TSFunction", link = "Function" },
		--  For builtin functions: `table.insert` in Lua." },
		{ name = "TSFuncBuiltin", link = "Function" },
		--  For macro defined fuctions (calls and definitions): each `macro_rules` in" },
		--  Rust." },
		{ name = "TSFuncMacro", link = "Function" },
		--  For includes: `#include` in C, `use` or `extern crate` in Rust, or `require`" },
		--  in Lua." },
		{ name = "TSInclude", link = "Include" },
		--  For keywords that don't fall in previous categories." },
		{ name = "TSKeyword", link = "Keyword" },
		--  For keywords used to define a fuction." },
		{ name = "TSKeywordFunction", link = "Keyword" },
		--  for operators that are English words, e.g. `and`, `as`, `or`." },
		{ name = "TSKeywordOperator", link = "Operator" },
		--  For labels: `label:` in C and `:label:` in Lua." },
		{ name = "TSLabel", link = "Label" },
		--  For method calls and definitions." },
		{ name = "TSMethod", link = "Function" },
		--  For identifiers referring to modules and namespaces." },
		{ name = "TSNamespace", link = "Identifier" },
		--  For no highlighting." },
		{ name = "TSNone", link = "None" },
		--  For all numbers" },
		{ name = "TSNumber", link = "Number" },
		--  For any operator: `+`, but also `->` and `*` in C." },
		{ name = "TSOperator", link = "Delimiter" },
		--  For parameters of a function." },
		{ name = "TSParameter", link = "None" },
		--  For references to parameters of a function." },
		{ name = "TSParameterReference", link = "None" },
		--  Same as `{ name = "TSField", link = "`." },
		{ name = "TSProperty", link = "Label" },
		--  For delimiters ie: `.`" },
		{ name = "TSPunctDelimiter", link = "None" },
		--  For brackets and parens." },
		{ name = "TSPunctBracket", link = "None" },
		--  For special punctutation that does not fall in the catagories before." },
		{ name = "TSPunctSpecial", link = "None" },
		--  For keywords related to loops." },
		{ name = "TSRepeat", link = "Repeat" },
		--  For strings." },
		{ name = "TSString", link = "String" },
		--  For regexes." },
		{ name = "TSStringRegex", link = "String" },
		--  For escape characters within a string." },
		{ name = "TSStringEscape", link = "None" },
		--  For identifiers referring to symbols or atoms." },
		{ name = "TSSymbol", link = "None" },
		--  Tags like html tag names." },
		{ name = "TSTag", link = "None" },
		--  Tag delimiter like `<` `>` `/`" },
		{ name = "TSTagDelimiter", link = "None" },
		--  For strings considered text in a markup language." },
		{ name = "TSText", link = "None" },
		--  For text to be represented in bold." },
		{ name = "TSStrong", link = "None" },
		--  For text to be represented with emphasis." },
		{ name = "TSEmphasis", link = "None" },
		--  For text to be represented with an underline." },
		{ name = "TSUnderline", link = "Underline" },
		--  For strikethrough text." },
		{ name = "TSStrike", link = "None" },
		--  Text that is part of a title." },
		{ name = "TSTitle", link = "None" },
		--  Literal text." },
		{ name = "TSLiteral", link = "None" },
		--  Any URI like a link or email." },
		{ name = "TSURI", link = "None" },
		--  For LaTex-like math environments." },
		{ name = "TSMath", link = "None" },
		--  For footnotes, text references, citations." },
		{ name = "TSTextReference", link = "None" },
		--  For text environments of markup languages." },
		{ name = "TSEnviroment", link = "None" },
		--  For the name/the string indicating the type of text environment." },
		{ name = "TSEnviromentName", link = "None" },
		--  Text representation of an informational note." },
		{ name = "TSNote", link = "None" },
		--  Text representation of a warning note." },
		{ name = "TSWarning", link = "WarningMsg" },
		--  Text representation of a danger note." },
		{ name = "TSDanger", link = "ErrorMsg" },
		--  For types." },
		{ name = "TSType", link = "Type" },
		--  For builtin types." },
		{ name = "TSTypeBuiltin", link = "Type" },
		--  Any variable name that does not have another highlight." },
		{ name = "TSVariable", link = "None" },
		--  Variable names that are defined by the languages, like `this` or `self`." },
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
