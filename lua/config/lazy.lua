local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local specs = {
  { import = "plugins" },
}

if vim.fn.filereadable(vim.env.HOME .. "/.goog/lua/goog_plugins/goog.lua") then
  table.insert(specs,
    { dir = "~/.goog/", import = "goog_plugins" }
  )
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = specs,
  install = { colorscheme = { "edge" } },
  rocks = { enabled = false },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
