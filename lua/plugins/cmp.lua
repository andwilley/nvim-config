return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
    },
    config = function ()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append("c")

      cmp.setup({
        snippet = {
          expand = function (args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          autocomplete = false,
          get_trigger_characters = function ()
            return { ".", "(" }
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sorting = {
          comparators = {}, -- We stop all sorting to let the lsp do the sorting
        },
        experimental = {
          native_menu = false,
          ghost_text = true,
        },
        mapping = cmp.mapping.preset.insert({
          -- why doesn't <leader> work here?
          [",."] = cmp.mapping.complete(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-1),
          ["<C-f>"] = cmp.mapping.scroll_docs(1),
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function (fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function (fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
