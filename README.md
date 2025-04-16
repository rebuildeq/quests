
make .vscode folder
make settings.json file
inside settings:
```json
{
    "Lua.runtime.version": "Lua 5.1",
    "Lua.workspace.library": [
        "/src/rebuildeq/server/eqemu-definitions"
    ],
    "Lua.diagnostics.disable": [
        "lowercase-global"
    ],
    "files.trimTrailingWhitespace": true
}
```


clone https://github.com/xackery/eqemu-definitions to any path you like, and change /src/rebuildeq/server/eqemu-definitions to that path