return {
  'neovim/nvim-lspconfig',
  lazy = false,
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- LUA
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        })
      end,
      settings = {
        Lua = {}
      },
    })

    -- more lsps
    require('lspconfig').arduino_language_server.setup({
      capabilities = capabilities,
      cmd = {
        "arduino-language-server",
        "-clangd=clangd",
        "-cli=arduino",
        "-cli-config=/Users/rafiki/Library/Arduino15/arduino-cli.yaml",
        "-fqbn=arduino:avr:nano",
      },
    })
  end,
}
