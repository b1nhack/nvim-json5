# Json5 parser for neovim

This crate provides json5 deserialization for neovim.

Inspired and adapted from [json5-rs](https://github.com/callum-oakley/json5-rs)

## Usage

You must have `cargo` installed and in your `$PATH`

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
	"b1nhack/nvim-json5",
	-- if you're on windows
	-- run = 'powershell ./install.ps1'
	build = "./install.sh",
	lazy = false,
}
```

## Why should I use this instead of the builtin `json_decode`?

Use this plugin to fix the error when [nvim-dap](https://github.com/mfussenegger/nvim-dap) reads vscode configuration files: 
> Error executing vim.schedule lua callback: .../.local/share/nvim/lazy/nvim-dap/lua/dap/ext/vscode.lua:148: Expected object key string but found T_OBJ_END at character 291 stack traceback:
	[C]: in function 'json_decode'

Replace the json_decode function in the nvim-dap configuration file: 

```lua
require("dap.ext.vscode").json_decode = require("json5").parse
```
