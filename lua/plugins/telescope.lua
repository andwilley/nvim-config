return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>sf",
      function ()
        require("telescope.builtin").find_files()
      end,
      mode = "n",
      noremap = true,
    },
    -- just open buffers (good for work where there are too many in the root)
    {
      "<leader>sgg",
      function ()
        require("telescope.builtin").live_grep({ grep_open_files = true })
      end,
      mode = "n",
      noremap = true,
    },
    -- search all files in the project root (don't use this at work)
    {
      "<leader>sga",
      function ()
        require("telescope.builtin").live_grep()
      end,
      mode = "n",
      noremap = true,
    },
    {
      "<leader>sb",
      function ()
        require("telescope.builtin").buffers()
      end,
      mode = "n",
      noremap = true,
    },
    {
      "<leader>sh",
      function ()
        require("telescope.builtin").help_tags()
      end,
      mode = "n",
      noremap = true,
    },
  },
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
}
