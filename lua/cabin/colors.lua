local M = {}
	local default_colors = {
		none = "NONE",
		black = "#000000",
		grey0 = "#171512",
		grey1 = "#1E1B17",
		grey2 = "#26231E",
		grey3 = "#38342B",
		grey4 = "#464036",
		grey5 = "#4F4A3D",
		grey6 = "#675F4F",
		grey7 = "#837865",
		grey8 = "#B9A57D",
		grey9 = "#D3C7AE",
		grey10 = "#E6E1D1",
		white = "#FFFFFF",
		red = "#E94C09",
		bright_red = "#F5841B",
		green = "#529E32",
		bright_green = "#A0CF19",
		yellow = "#FDBC18",
		bright_yellow = "#F8DB40",
		blue = "#477CE3",
		bright_blue = "#05ACF4",
		cyan = "#18AC88",
		bright_cyan = "#79DBBE",
		magenta = "#BF236E",
		bright_magenta = "#F16C8C",
	}

M.setup = function(options)
	local colors = vim.deepcopy(default_colors)
	colors.fg = default_colors.grey9
	colors.bg = default_colors.grey1
	colors.highlight = default_colors.yellow
	colors.elevation = {
		down2 = default_colors.black,
		down1 = default_colors.grey0,
		up1 = default_colors.grey3,
		up2 = default_colors.grey4,
		up3 = default_colors.grey5,
	}

	return colors
end

return M
