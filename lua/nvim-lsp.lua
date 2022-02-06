local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "sumneko_lua",
  "pyright",
  "tsserver",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_available, server = lsp_installer.get_server(name)

  if server_available then
    server:on_ready(function ()
      server:setup({})
    end)
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

require("lsp_signature").setup({})
