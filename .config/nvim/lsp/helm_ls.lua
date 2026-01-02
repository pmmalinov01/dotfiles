return {
    cmd = { "helm_ls", "serve" },
    filetypes = { "helm", "helmfile", "yaml.helm", "yaml.helm-values" },
    settings = {
        yamlls = {
            enabled = true,
            enabledForFilesGlob = "*.{yaml,yml,tpl}",
        },
    },
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
}


