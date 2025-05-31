# dotfiles-devpod

WIP!!! :D

#### Steps to Implement
1. You will want to use a .json file per-project for your dev container configuration, so I like to choose a consistent name to use
and then add it to my systems global .gitignore file.
    1. `cd` to root
    2. `touch .gitignore_global`, or whatever you name it
    3. ```git config --global core.excludesfile ~/.gitignore_global```
    4. Add the name for your .json file, here I will use `.bridger-devcontainer.json`
2. Create that devcontainer json file in your desired project.
3. Choose a base image for your devcontainer here:<br>
<a>https://github.com/devcontainers/images/tree/main/src</a>
4. Choose the packages you want to install here:<br>
https://containers.dev/features
5. Choose the appropriate devcontainer feature for your system. For example, if you want to use the `homebrew` package manager at all for 
your Linux container hosted on a Mac ARM machine, you will need to use NixOS. But `neovim-homebrew` or `python` are other examples.
6. Write your devcontainer json settings, for me I am choosing:
    - a base image of `base:debian`.
    - my list of packages wanted
    - `nix` to allow usage of `homebrew` on a Linux container hosted on a Mac ARM machine.
<br>ie. <br>
```
{
    "image": "mcr.microsoft.com/devcontainers/base:debian",
    "features": {
        "ghcr.io/devcontainers/features/nix:1": {
            "packages": [
                "git",
                "python3.10.13",
                "aws-cli",
                "homebrew",
                "neovim"
            ]
        }
    }
}
```
7. Install Devpod. This will allow us to run devcontainers in Docker or Kubernetes.
