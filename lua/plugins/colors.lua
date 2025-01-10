return {
  "sainnhe/edge",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000,
  config = function ()
    -- load the colorscheme here
    vim.opt.background = "light"
    vim.g.edge_enable_italic = true
    vim.cmd.colorscheme("edge")
  end,
}
