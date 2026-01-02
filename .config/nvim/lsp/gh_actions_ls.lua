return {
  -- https://github.com/lttb/gh-actions-language-server/issues/4#issuecomment-2587990900

  cmd = { "github-actions-languageserver", "--stdio" },
  filetypes = { "yaml" },
  init_options = {
    -- Requires the `repo` and `workflow` scopes
    sessionToken = os.getenv("GITHUB_ACTIONS_LS_TOKEN"),
    root_markers = { ".github/" },
  }
}
