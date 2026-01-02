return {
  -- Command and arguments to start the server.
  cmd = { 'bash-language-server', "start" },

  -- Filetypes to automatically attach to.
  filetypes = { "bash", "sh" },
  root_markers = {".git"},

  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)"
    }
  }

}
