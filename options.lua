-- set vim options here (vim.<first_key>.<second_key> =  value)
return {
	opt = {
		relativenumber = false, -- sets vim.opt.relativenumber
		guifont = "JetBrainsMono Nerd Font:h10",
		listchars = {
			tab = ">-",
			space = "·",
			nbsp = "␣",
			trail = "•",
			eol = "¶",
		},
		tabstop = 4,
		shiftwidth = 4,
	},
	g = {
		mapleader = " ", -- sets vim.g.mapleader
		gitblame_date_format = "%r",
	},
}
