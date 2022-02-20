local colors = require'cabin.colors'
local M = {}

M.options = {
		fat_vert_split = false,
		colored_columns = true,
		colors = colors,
}

M.set_options = function(options)
	options = options or {}
	M.options = vim.tbl_deep_extend("force", M.options, options)
end

return M
