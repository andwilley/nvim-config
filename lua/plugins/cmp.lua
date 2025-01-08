return {
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
    },
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
              vim.snippet.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['S-<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.snippet.active({ direction = -1 }) then
              vim.snippet.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    end
  },
}
