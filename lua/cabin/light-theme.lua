local M = {}

function M.setup(colors)
	local cs =colors
	local theme = {
		normal = {
			fg = cs.grey900,
			bg = cs.grey200,
		},
		float = {
			fg = cs.grey900,
			bg = cs.grey300,
		},
		status = {
			fg = cs.grey900,
			bg = cs.grey300,
		},
		vcs = {
			add = { fg = cs.grass700 },
			remove = { fg = cs.red700 },
			change = { fg = cs.sky700 },
		},
		diff = {
			add = { bg = cs.grass200 },
			remove = { bg = cs.red200 },
			change = { bg = cs.sky200 },
		},
		visual = {
			bg = cs.sky200,
		},
		numbers = {
			fg = cs.none,
		},
		semantic = {
			success = {
				fg = cs.grey100,
				bg = cs.grass700,
			},
			info = {
				fg = cs.grey100,
				bg = cs.sky700,
			},
			warn = {
				fg = cs.grey100,
				bg = cs.yellow700,
			},
			error = {
				fg = cs.grey100,
				bg = cs.red700,
			},
		},
		diagnostic = {
			info = {
				fg = cs.sky800,
				bg = cs.sky100,
			},
			hint = {
				fg = cs.grass800,
				bg = cs.grass100,
			},
			warn = {
				fg = cs.yellow800,
				bg = cs.yellow100,
			},
			error = {
				fg = cs.red800,
				bg = cs.red100,
			},
		},
		search = {
			bg = cs.sky200,
		},
		pmenu = {
			fg = cs.grey900,
			bg = cs.grey400,
		},
		wildmenu = {
			fg = cs.grey200,
			bg = cs.sky800,
		},
		qf = {
			fg = cs.grey900,
			bg = cs.green500,
		},
		syntax = {
			-- Comment
			comment = { fg = cs.cyan800, italic = true },
			-- Constant
			constant = { fg = cs.none },
			string = { fg = cs.red800 },
			char = { fg = cs.red900, italic = true },
			number = { fg = cs.yellow800 },
			-- Identifier
			identifier = { fg = cs.none },
			fn = { fg = cs.sky800, bold = true  },
			-- Statement
			statement = { fg = cs.grass800, bold = true },
			label = { fg = cs.none },
			-- PreProc
			preproc = { fg = cs.magenta300 },
			-- Type
			type = { fg = cs.cyan700, bold = true },
			-- Special
			special = { fg = cs.none },
			tag = { fg = cs.none },
		},
	}
  return theme
end

return M
