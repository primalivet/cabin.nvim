local M = {}

function M.setup(colors)
	local cs =colors
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
			number = { fg = cs.magenta300 },
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
  return theme
end

return M
