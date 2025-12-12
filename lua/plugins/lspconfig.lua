return {
  "neovim/nvim-lspconfig",
  lazy = false,
  keys = {
    { "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", mode = "n", noremap = true },
    { "<leader>gf", "<cmd>lua vim.lsp.buf.code_action()<CR>", mode = "n", noremap = true },
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
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- go
    vim.lsp.config("gopls", {
      capabilities = capabilities,
      settings = {
        gopls = {
          usePlaceholders = true,
          completeUnimported = true,
          env = {
            GOPACKAGESDRIVER = vim.fn.getcwd() .. "/gopackagesdriver.sh",
          },
        },
      },
    })
    vim.lsp.enable("gopls")

    -- Rust
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = false,
          },
        },
      },
    })
    vim.lsp.enable("rust_analyzer")

    -- Bzl
    vim.lsp.config("starpls", {})
    vim.lsp.enable("starpls")

    -- LUA
    vim.lsp.config("lua_ls", {
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
    vim.lsp.enable("lua_ls")

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      cmd = {
        "clangd",
        "--compile-commands-dir",
        "./build/",
      },
    })
    vim.lsp.enable("clangd")
  end,
}
