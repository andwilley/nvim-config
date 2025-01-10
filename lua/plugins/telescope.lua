return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  defaults = {
    -- layout_strategy = 'vertical',
    path_display = function (opts, path)
      -- Do common substitutions
      path = path:gsub("^/google/src/cloud/[^/]+/[^/]+/google3/", "google3/", 1)
      path = path:gsub("^google3/java/com/google/", "g3/j/c/g/", 1)
      path = path:gsub("^google3/javatests/com/google/", "g3/jt/c/g/", 1)
      path = path:gsub("^google3/third_party/", "g3/3rdp/", 1)
      path = path:gsub("^google3/", "g3/", 1)

      -- Do truncation. This allows us to combine our custom display formatter
      -- with the built-in truncation.
      local new_opts = {
        path_display = {
          truncate = true,
        },
        __length = opts.__length,
      }
      path = require("telescope.utils").transform_path(new_opts, path)
      opts.__length = new_opts.__length
      return path
    end,
  },
  init = function ()
    local opts = { noremap = true, silent = true }
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.find_files, opts)
    -- just open files (good for work where there are a lot)
    vim.keymap.set("n", "<leader>sgg", function ()
      builtin.live_grep({ grep_open_files = true })
    end, opts)
    -- get all files in the project root (don't use this at work)
    vim.keymap.set("n", "<leader>sga", builtin.live_grep, opts)
    vim.keymap.set("n", "<leader>sb", builtin.buffers, opts)
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, opts)
  end,
}
