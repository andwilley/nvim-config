return {
  'romainl/flattened',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000,
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme flattened_dark]])
  end,
}
