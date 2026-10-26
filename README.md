![icon](./icon.png)

# Instant Coffee (.NET)

Instant Coffee (.NET) extends [Instant Coffee](https://github.com/lukejoshuapark/instant-coffee) with
.NET Core.

Both `amd64` and `arm64` images are supported.

## Image URL

```url
ghcr.io/lukejoshuapark/instant-coffee-dotnet:0.11.1
```

## Installed Software

Everything from the base Instant Coffee image is included, plus:

|Name|Type|Version|
|----|----|-------|
|.NET Core|💙 Language/Runtime|10.0|

## Dev Container Template

Place this in a `.devcontainer/devcontainer.json` file in your project to use
Instant Coffee.

```json
{
	"image": "ghcr.io/lukejoshuapark/instant-coffee:0.11.1",
	"runArgs": [ "--add-host", "host.docker.internal:host-gateway" ],
	"mounts": [
		"source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind",
		"source=claude-code-config,target=/root/.claude,type=volume"
	],
	"containerEnv": {
		"CLAUDE_CONFIG_DIR": "/root/.claude"
	},
	"customizations": {
		"vscode": {
			"extensions": [
				"dbaeumer.vscode-eslint",
				"eamodio.gitlens",
				"golang.go",
				"hashicorp.terraform",
				"ms-dotnettools.csdevkit",
				"rust-lang.rust-analyzer",
				"tamasfe.even-better-toml"
			],
			"settings": {
				"js/ts.preferences.quoteStyle": "double",
				"editor.tabSize": 4,
				"editor.insertSpaces": false,
				"editor.detectIndentation": false,
				"[rust]": {
					"editor.insertSpaces": true
				},
				"[yaml]": {
					"editor.insertSpaces": true,
					"editor.tabSize": 2
				},
				"[csharp]": {
					"editor.insertSpaces": true
				},
				"files.insertFinalNewline": true,
				"files.trimTrailingWhitespace": true,
				"remote.autoForwardPorts": false
			}
		}
	}
}
```
