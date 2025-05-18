local jsts_settings = {
    suggest = { completeFunctionCalls = true },
    inlayHints = {
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = 'literals' },
        variableTypes = { enabled = true },
    },
}

---@type vim.lsp.Config
return {
    cmd = { 'vtsls', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue'},
    root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
    settings = {
        typescript = jsts_settings,
        javascript = jsts_settings,
        vtsls = {
            -- Automatically use workspace version of TypeScript lib on startup.
            autoUseWorkspaceTsdk = true,
            experimental = {
                -- Inlay hint truncation.
                maxInlayHintLength = 30,
                -- For completion performance.
                completion = { enableServerSideFuzzyMatch = true },
            },
        },
    },
    before_init = function(params, config)
		local result = vim.system(
			{ "npm", "query", "#vue" },
			{ cwd = params.workspaceFolders[1].name, text = true }
		):wait()
		if result.stdout ~= "[]" then
			local vuePluginConfig = {
				name = "@vue/typescript-plugin",
				location = require("mason-registry").get_package("vue-language-server"):get_install_path()
					.. "/node_modules/@vue/language-server",
				languages = { "vue" },
				configNamespace = "typescript",
				enableForWorkspaceTypeScriptVersions = true,
			}
			table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
		end
	end,
}
