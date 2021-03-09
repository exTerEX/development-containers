# Development-Containers

A project to create developer centric containers for development using [Visual Studio Code](https://code.visualstudio.com) and the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension pack. All the containers use Ubuntu LTS distributions initiated with a non-root user and [oh-my-bash](https://ohmybash.nntoan.com) for terminal utilities.

## Example

To use a devcontainer in Visual Studio Code, add `.devcontainer/devcontainer.json` to your workspace. In `devcontainer.json` add,

```json
{
    "name": "",
    "image": "<ENV>"
}
```

where *<ENV>* is any of the images in `*-dev` directories, e.g. `exterex/cpp-dev:latest`, `exterex/r-dev:latest`, etc.

All images contain a non-root user, `vscode` (default) and can be changed with,

```json
"remoteUser": ""
```

By default Visual Studio Code rebuild image to update UID/GID to match local user's UID/GID. To disable this,

```json
"updateRemoteUserUID": false
```

To sync time and timezone from local machine to devcontainer use,

```json
"runArgs": [
    "-v", "/etc/localtime:/etc/localtime:ro"
]
```

## Contribute



### Target branch rules

To contribute follow the branch naming convention,

| Instance |     Branch     |                Description & Instructions |
| :------- | :------------: | ----------------------------------------: |
| Working  |      main      | Accepts merges from Features and Hotfixes |
| Feature  | \*-env-feature |                    Always branch off Main |
| Bugfix   |   \*-env-fix   |                    Always branch off Main |

Where **env** is the descriptor (*) in *-dev directory.

## Build



## License

This repository is licensed under `Apache-2.0`. For more information see [LICENSE](LICENSE).
