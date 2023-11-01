require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "gopls",
    "pyright",
    "efm",
    "lua_ls",
    "jdtls",
    "tsserver",
    "yamlls",
  },
}
require("lsp_signature").setup()

local capabilities = require("ddc_nvim_lsp").make_client_capabilities()
require("lspconfig").denols.setup({
  capabilities = capabilities,
})
