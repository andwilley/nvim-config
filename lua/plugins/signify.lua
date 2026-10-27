return {
  "msuozzo/vim-signify",
  -- `keys` implies lazy=true, which would keep signify from ever loading
  -- (and placing gutter signs) until the mapping is pressed.
  lazy = false,
  keys = {
    { "<leader>dd", "<cmd>SignifyDiff<cr>", desc = "Signify: Toggle Diff Mode" },
  },
  init = function ()
    vim.opt.updatetime = 100
  end,
}
