return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
        },
        web_devicons = {
          file = {
            enable = false,
          },
          folder = {
            enable = false,
          },
        },
        glyphs = {
            default = "-",
            symlink = "@",
            bookmark = "b",
            modified = "●",
            hidden = " ",
            folder = {
              arrow_closed = ">",
              arrow_open = "v",
              default = "-",
              open = "",
              empty = "e",
              empty_open = "E",
              symlink = "@",
              symlink_open = "@",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "u",
              renamed = "➜",
              untracked = "★",
              deleted = "d",
              ignored = "◌",
            },
        }
      },
    },
  },
}
