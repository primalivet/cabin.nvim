local M = {}

local colors = require("cabin.colors")

M.options = {
	fancy_pants = false,
	light = false,
	colors = colors,
}

function M.setup(options)
	M.options = vim.tbl_deep_extend("force", M.options, options or {})
end

local function set_config_bg()
	-- TODO: there should be another more direct way to reach the background variable
	if vim.opt.background._value == "light" then
		M.options = vim.tbl_deep_extend("force", M.options, { light = true })
	else
		M.options = vim.tbl_deep_extend("force", M.options, { light = false })
	end
end

local function apply_theme()
	local sections = require("cabin.theme").setup(M.options)
	for name, group in pairs(sections) do
		local highlight_command = require("cabin.utils").stringify_group(name, group)
		vim.cmd(highlight_command)
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
	apply_theme()

	local group = vim.api.nvim_create_augroup("CABIN", {})
	vim.api.nvim_create_autocmd({ "OptionSet" }, {
		group = group,
		pattern = "background",
		callback = function()
			set_config_bg()
			apply_theme()
		end,
	})
end

return M
