local dark = require('cabin.theme-dark')
local light = require('cabin.theme-light')
local M = {}

-- HiGroup {
--   name: String,
--   link?: String (GroupName)
--   fg: String (HEX)
--   bg: String (HEX)
--   style: String (Bold,Italics,Reverse)
-- }

function M.setup(config)
	local theme = config.light and light.get_theme(config) or dark.get_theme(config)
	return theme
end

return M
