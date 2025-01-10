return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = false,
      section_separators = { left = "", right = "" },
      component_separators = { left = "|", right = "|" },
      theme = "edge",
    },
    sections = {
      lualine_c = { { "filename", path = 1 } },
    },
    tabline = {
      lualine_a = { "buffers" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
