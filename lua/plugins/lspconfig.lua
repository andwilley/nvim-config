return {
  "neovim/nvim-lspconfig",
  lazy = false,
  keys = {
    { "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", mode = "n", noremap = true },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", mode = "n", noremap = true },
    { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", mode = "n", noremap = true },
    { "<leader>g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", mode = "n", noremap = true },
    { "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", mode = "n", noremap = true },
    { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", mode = "n", noremap = true },
    { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", mode = "n", noremap = true },
    { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", mode = "n", noremap = true },
    { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", mode = "n", noremap = true },
    { "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", mode = "n", noremap = true },
    { "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", mode = "n", noremap = true },
    { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", mode = "n", noremap = true },
    { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", mode = "n", noremap = true },
  },
  config = function ()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LUA
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_init = function (client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc")
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })

    require("lspconfig").clangd.setup({
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      cmd = {
        "clangd",
        "--compile-commands-dir",
        "./build/",
      },
    })
  end,
}
