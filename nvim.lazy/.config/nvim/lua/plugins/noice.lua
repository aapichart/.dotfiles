return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper
    "MunifTanjim/nui.nvim",
    -- Optional:
    -- "nvim-notify" is only needed, if you want to use the notify
    -- if not available, we use 'mini' as the fallback
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          backgrount_colour = "#000000"
        })
      end,
    },
  },
}
