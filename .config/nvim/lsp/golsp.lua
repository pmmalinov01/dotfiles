return {

  -- Command and arguments to start the server.
  cmd = { 'gopls' },

  -- Filetypes to automatically attach to.
  filetypes = { 'go', 'go.mod' },

  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    }
  }

}
