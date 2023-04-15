local M = {}

local colors = require("cabin.colors")
local defaultTheme = require("cabin.dark-theme")

M.options = {
	colors = colors,
	theme = defaultTheme.setup(colors),
}


function M.setup(options)
	M.options = vim.tbl_deep_extend("force", M.options, options or {})
end

local function set_config_bg()
	if vim.opt.background:get() == "light" then
		M.options = vim.tbl_deep_extend("force", M.options, { theme = require("cabin.light-theme").setup(M.options.colors) })
	else
		M.options = vim.tbl_deep_extend("force", M.options, { theme = require("cabin.dark-theme").setup(M.options.colors) })
	end
end

local function apply_theme(theme)
	local sections = require("cabin.highlights").setup(theme)
	for name, group in pairs(sections) do
		vim.api.nvim_set_hl(0, name, group)
	end
end

function M.load()
	-- clear if not colorscheme default
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	-- Reset the colors, they might have been messed up
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	if not vim.o.termguicolors then
		print("Turning on option 'termguicolors'")
		vim.o.termguicolors = true
	end

	vim.g.colors_name = "cabin"

	set_config_bg()
	apply_theme(M.options.theme)

	local group = vim.api.nvim_create_augroup("CABIN", {})
	vim.api.nvim_create_autocmd({ "OptionSet" }, {
		group = group,
		pattern = "background",
		callback = function()
			set_config_bg()
			apply_theme(M.options.theme)
		end,
	})
end

return M
