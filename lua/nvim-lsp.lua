require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "denols",
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
require("mason-lspconfig").setup_handlers {
  function(server_name)
    local capabilities = nil
    local settings = nil

    if server_name == "denols" then
      capabilities = require("ddc_source_lsp").make_client_capabilities()
    elseif server_name == "jdtls" then
      settings = {
        ["java.signatureHelp.description.enabled"] = true,
        ["java.codeGeneration.generateComments"] = true
      }
    end

    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      settings = settings,
    }
  end
}
require("lsp_signature").setup {}
