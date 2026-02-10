# dot_files

This is a compilation of my private dot files for linux setup. This is currently for an arch build running with hyprland as its composite.

Before proceeding do the following:

    - Ensure that multilib is enable in /etc/pacman.conf (lib32-nvidia-utils package requirement - That package is needed for Steam)

    - Ensure that the setting i "/etc/gai.conf" that allows IPv4 prioritization. This might also be needed during the Arch install especially if 8.8.8.8
        can be pinged but google.com can't.

Install Ansible and run the Ansible Playbook:

    - Install ansible by running "pacman -S ansible"

    - Run the ansible playbook through the "ansible-playbook main.yaml -K" command

    - After the playbok has run its course ensure that the "systemd-networkd-wait-online.service" is still disabled. It might be enabled during one of the package installs.

Once all packages has been installed use the "cp_to_config.sh" to copy the relevant configuration to the "$HOME/.config/" folder. Also remember to alter the monitor name and resolution in the hyprland.conf (run "hyprctl monitors" for this) along with the monitor name in the hyprpaper.conf.

Below is an assortment of notes that might/might not be relevant:

    - 3D software such as FreeCAD or Bambulab Studio will fail to render the 3D compositor unless launched with:
        - __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json <NAME OF PROGRAM>

    - Be aware that on newer WIFI devices the system might default to IPv6 first which can fail to resolve some sites (e.g. archlinux.org during the arch install).
      It can however, also throw off initialization of Hyprland. If the following is displayed after initialization of Hyprland:
        - "graphical.target is queued for start, waiting for 60s..."
      This might be network related and possible fixes include:
        - Editing the "/etc/gai.conf" and uncommenting the line below the text "For sites which prefer IPv4 connections change the last line to"
        - Networkd waiting for an online signal, in order to disable this run "systemctl disable systemd-networkd-wait-online.service"

    - DotNet
        - For installing the Roslyn Language Server (https://github.com/dotnet/dotnet/blob/main/src/roslyn/README.md) either:
            - Navigate to the URL "https://dev.azure.com/dnceng/public/_artifacts"
            - Find a feed with a new build of the LanguageServer, this can be done by searching "dotnet" in the feed selector, e.g. "https://dev.azure.com/dnceng/public/_artifacts/feed/dotnet10"
            - Search for Microsoft.CodeAnalysis.LanguageServer and select the build for the appropriate architecture, e.g. "linux-x64"
            - Download the nuget package, rename it to have the ".zip" file type and unzip it.
            - Find the folder where the executable of interest lies, e.g. "./content/LanguageServer/linux-x64"
            - Make the "Microsoft.CodeAnalysis.LanguageServer" executable by running chmod
            - Test it can execute and profit!

    - Python version manager:
        - use pacman to install pyenv and follow the guides from their github for how to config ~/.bashrc etc.
        - Install pyenv-virutalenv by following the install guides on their github repo along with the config of ~/.bashrc.
        - Once finished reboot the system, just to be sure and "pyenv" along with "pyenv virutalenv" can now be used to download and configure virtual environments.

    - For extra resources on Neovim check out: https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a

    - For remote Python debugging, eg. through Docker, do the following:
        - Install debugpy on both the local and the remote machine

