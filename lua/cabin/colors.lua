local cabin = {
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

local colors = vim.deepcopy(cabin)
colors.fg = cabin.grey9
colors.bg = cabin.grey1
colors.highlight = cabin.yellow
colors.elevation = {
	down2 = cabin.black,
	down1 = cabin.grey0,
	up1 = cabin.grey3,
	up2 = cabin.grey4,
	up3 = cabin.grey5,
}

return colors
