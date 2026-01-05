return {

	-- Command and arguments to start the server.
	cmd = { "docker-language-server", "start", "--stdio" },

	-- Filetypes to automatically attach to.
	filetypes = { "dockerfile", "yaml.docker-compose" },
	root_markers = {
		"Dockerfile",
		"docker-compose.yaml",
		"docker-compose.yml",
		"compose.yaml",
		"compose.yml",
		"docker-bake.json",
		"docker-bake.hcl",
		"docker-bake.override.json",
		"docker-bake.override.hcl",
	},
}
