-- Find more schemas here: https://www.schemastore.org/json/
 local schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "/cloudformation/*.{yml,yaml}",
}

local opts = {
  settings = {
    yaml = {
      schemas = schemas,
    },
  },
  setup = {
   redhat = {
    telemetry = {
      enabled = false
    }
  }
  },
}

return opts

