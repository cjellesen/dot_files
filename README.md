# dot_files

This is a compilation of my private dot files for linux setup. This is currently for an arch build running with hyprland as its composite.

Program installations:

    - Run the ansible playbook through the "ansible-playbook main.yaml -K" command

    -Use the "cp_to_config.sh" to copy the relevant configuration to the "$HOME/.config/" folder
        - Rememeber to alter the monitor name and resolution to match the monitor setup of the computer

    - In order for the Mason plugin (plugin manager for Neovim) to function the system need to have npm installed.
        - To install npm first install its dependency, nodejs, and then proceed to install npm.

    - Python version manager:
        - use pacman to install pyenv and follow the guides from their github for how to config ~/.bashrc etc.
        - Install pyenv-virutalenv by following the install guides on their github repo along with the config of ~/.bashrc.
        - Once finished reboot the system, just to be sure and "pyenv" along with "pyenv virutalenv" can now be used to download and configure virtual environments.

    - For extra resources on Neovim check out: https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a

    - For remote Python debugging, eg. through Docker, do the following:
        - Install debugpy on both the local and the remote machine

    - DotNet
        - For installing the Roslyn Language Server (https://github.com/dotnet/dotnet/blob/main/src/roslyn/README.md) either:
            - Navigate to the URL "https://dev.azure.com/dnceng/public/_artifacts"
            - Find a feed with a new build of the LanguageServer, this can be done by searching "dotnet" in the feed selector, e.g. "https://dev.azure.com/dnceng/public/_artifacts/feed/dotnet10"
            - Search for Microsoft.CodeAnalysis.LanguageServer and select the build for the appropriate architecture, e.g. "linux-x64"
            - Download the nuget package, rename it to have the ".zip" file type and unzip it.
            - Find the folder where the executable of interest lies, e.g. "./content/LanguageServer/linux-x64"
            - Make the "Microsoft.CodeAnalysis.LanguageServer" executable by running chmod
            - Test it can execute and profit!

    - 3D software such as FreeCAD or Bambulab Studio will fail to render the 3D compositor unless launched with:
        - __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json <NAME OF PROGRAM>

    - Be aware that on newer WIFI devices the system will default to IPv6 first which can fail to resolve some sites (e.g. archlinux.org during the arch install).
      It can however, also throw off initialization of Hyprland and while one would not assume a line like this: "graphical.target is queued for start, waiting for 60s..."
      is related to network, going into the /etc/gai.conf and uncommenting the line below the text "For sites which prefer IPv4 connections change the last line to"
      will result in Hyprland starting and not getting stuck.

    - Remeber to also disable systemd-networkd-wait-online.service to avoid process stalling
