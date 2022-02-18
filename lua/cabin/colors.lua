local cabin = {
	none = "NONE",
	white = "#FFFFFF",
	black = "#000000",
	-- More towards grey
	-- grey0 = "#0C0B08",
	-- grey1 = "#191610",
	-- grey2 = "#28231A",
	-- grey3 = "#352F24",
	-- grey4 = "#413C31",
	-- grey5 = "#4F493D",
	-- grey6 = "#615D56",
	-- grey7 = "#7A766E",
	-- grey8 = "#A19D95",
	-- grey9 = "#C4C2BC",
	-- grey10 = "#DEDDDA",

	-- More towards brown
	-- grey0 = "#17140D",
	-- grey1 = "#1B160E",
	-- grey2 = "#2B2417",
	-- grey3 = "#3A301F",
	-- grey4 = "#4B3E28",
	-- grey5 = "#5B4E31",
	-- grey6 = "#776540",
	-- grey7 = "#977D51",
	-- grey8 = "#B9A57D",
	-- grey9 = "#D3C7AE",
	-- grey10 = "#E6E1D1",

	-- green = "#7BAA4D",
	-- red = "#D85421",
	-- yellow = "#FDBC18",
	-- blue = "#4E86C8",
	-- cyan = "#439C81",
	-- magenta = "#BE4779",
	-- orange = "#FB8C26",
	-- purple = "#865ECF",
	-- pink = "#CC53B1",
	-- bright_green = "#B0CA79",
	-- bright_red = "#E57C54",
	-- bright_yellow = "#F2D46D",
	-- bright_blue = "#7DA7D9",
	-- bright_cyan = "#8ABFAF",
	-- bright_magenta = "#C0698E",
	-- bright_orange = "#ECAD72",
	-- bright_purple = "#AF97DC",
	-- bright_pink = "#DB8FCA",
	--
	-- Brighter
	green = "#529E32",
	red = "#E94C09",
	yellow = "#FDBC18",
	blue = "#477CE3",
	cyan = "#18AC88",
	magenta = "#BF236E",
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
	bright_green = "#A0CF19",
	bright_red = "#F5841B",
	bright_yellow = "#F8DB40",
	bright_blue = "#05ACF4",
	bright_cyan = "#79DBBE",
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
