return {
	"lmburns/lf.nvim",
	lazy = false,
	dependencies = {
		"akinsho/toggleterm.nvim",
	},
  config = function()
    require("lf").setup({
      default_action = "tabedit",
    })
  end
}
