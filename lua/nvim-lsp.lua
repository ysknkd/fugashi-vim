local lsp_config = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "gopls",
  "pyright",
  "sumneko_lua",
  "tsserver",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_available, server = lsp_installer.get_server(name)

  if server_available then
    server:on_ready(function ()
      local opts = {}
      if "tsserver" == name then
        opts.root_dir = lsp_config.util.root_pattern("package.json", "node_modules", "./")
      end
      server:setup(opts)
    end)
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

require("lsp_signature").setup({})
