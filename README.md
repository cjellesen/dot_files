# dot_files

This is a compilation of my private dot files for linux setup. This is currently for an arch build running with hyprland as its composite.

Program installations:

    - In order for the Mason plugin (plugin manager for Neovim) to function the system need to have npm installed.
        - To install npm first install its dependency, nodejs, and then proceed to install npm.

    - Python version manager:
        - use pacman to install pyenv and follow the guides from their github for how to config ~/.bashrc etc.
        - Install pyenv-virutalenv by following the install guides on their github repo along with the config of ~/.bashrc.
        - Once finished reboot the system, just to be sure and "pyenv" along with "pyenv virutalenv" can now be used to download and configure virtual environments.

    - For arch I do not use a direct install of the Azure CLI, instead use the documentation for how to run it in a container.
    - For MSSQL dependency for ODBC connection and etc. the AUR has a "mssql-tools" repository that installs any dependencies required for this.

    - For extra resources on Neovim check out: https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a

    - For remote Python debugging, eg. through Docker, do the following:
        - Install debugpy on both the local and the remote machine

    - DotNet
        - For installing the Roslyn Language Server (https://github.com/dotnet/dotnet/blob/main/src/roslyn/README.md) either:
            - Download the source code for the latest release and compile your self
            - Navigate to the URL "https://dev.azure.com/dnceng/public/_artifacts"
            - Find a feed with a new build of the LanguageServer, this can be done by searching "dotnet" in the feed selector, e.g. "https://dev.azure.com/dnceng/public/_artifacts/feed/dotnet10"
            - Search for Microsoft.CodeAnalysis.LanguageServer and select the build for the appropriate architecture, e.g. "linux-x64"
            - Download the nuget package, rename it to have the ".zip" file type and unzip it.
            - Find the folder where the executable of interest lies, e.g. "./content/LanguageServer/linux-x64"
            - Make the "Microsoft.CodeAnalysis.LanguageServer" executable by running chmod
            - Test it can execute and profit!
