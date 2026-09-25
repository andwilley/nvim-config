return {
  "msuozzo/vim-signify",
  keys = {
    { "<leader>dd", "<cmd>SignifyDiff<cr>", desc = "Signify: Toggle Diff Mode" },
  },
  init = function ()
    vim.opt.updatetime = 100
  end,
}
