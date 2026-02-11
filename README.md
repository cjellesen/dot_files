# Installing the dot files

This is a compilation of my private dot files for linux setup. This is currently for an arch build running with hyprland as its compositor.

Before proceeding do the following:

    - Ensure that multilib is enable in /etc/pacman.conf (for lib32-nvidia-utils)

    - Ensure that the setting in "/etc/gai.conf" that allows IPv4 prioritization is on.

The last step might also be relevant during an Arch install as a solution to problems pinging a site via its FQDN even though it can be pinged using its IP.

Install Ansible and run the Ansible Playbook:

    - Install ansible by running "pacman -S ansible"

    - Run the ansible playbook through the "ansible-playbook main.yaml -K" command

After the playbok has run its course ensure that the "systemd-networkd-wait-online.service" is still disabled. It might be enabled during one of the package installs.

Once all packages has been installed use the "cp_to_config.sh" to copy the relevant configuration to the "$HOME/.config/" folder and run "hyprctl reload". Also remember to alter the monitor name and resolution in the hyprland.conf (run "hyprctl monitors" for this) along with the monitor name in the hyprpaper.conf.

## After installation notes
Below is an assortment of notes that might/might not be relevant:

3D software such as FreeCAD or Bambulab Studio will fail to render the 3D compositor unless launched with:

    - __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json <NAME OF PROGRAM>

Be aware that on newer network devices the system might default to IPv6 first which can fail to resolve some sites (e.g. archlinux.org during the arch install). It can however, also throw off initialization of Hyprlandand result in the following status message after initialization of Hyprland:

    - "graphical.target is queued for start, waiting for 60s..."

This might be network related and possible fixes include:

    - IPv4 not being prioritized and can be resolved by editing the "/etc/gai.conf" as mentioned in the beginning

    - Networkd waiting for an online signal, in order to disable this run "systemctl disable systemd-networkd-wait-online.service"

# Neovim
I have yet to modernize my Neovim setup. I am planning to move from the Jetbrains Rider to Neovim but the ergonomics are not quite there yet for a full migrations. This portion of the README will come at a later time.
For extra resources on Neovim check out: https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a.

# DotNet
Below is a small section of useful info for writing code in C# on Linux.

## Getting an LSP
Downloading the LanguageServer to provide linting for C# development can be abit of a pain. What it boils down to is finding the NuGet package Microsoft.CodeAnalysis.LanguageServer and downloading it. The best way to do this has, in my experience, been to browse the public the public AzureFeed for Microsoft. Some of the places I've had success with are:

    - https://dev.azure.com/azure-public/vside
    - https://dev.azure.com/dnceng/public/

Once a feed with the package "Microsoft.CodeAnalysis.LanguageServer" has been located download the NuGet file for the appropriate architecture, e.g. "linux-x64".

NuGet files are essentially just .zip files so change the extension by renaming it from the ".nupkg" extension to ".zip" and unpack it.

Once unpacked find the executable "Microsoft.CodeAnalysis.LanguageServer" in the "./content/LanguageServer/<architecture>/" folder and make it executable using chmod. Once this is done test it can execute.

For the fancy folks, create a folder to store content of the of "./content/LanguageServer/<architecture>/" in and in the "/usr/local/bin/" folder create symlink to the "Microsoft.CodeAnalysis.LanguageServer" executable by running "sudo ln -sf <PATH TO EXECUTABLE> /usr/local/bin/language-server". The language server can now be executed using "language-server".

As a note, the Neovim setup currently expects the language server to be called using the command "language-server" so the portion about the symlinking is required to get LSP integration with Neovim for C# projects. Once this is done the workflow in Neovim for getting linting outside the current file is:

    - On intialization of Neovim set the compiler to dotnet using ":compile dotnet"

    - The build chain can now be intialized by running ":make" which builds and adds its output to the quick fix list

    - The result of the build can be in the quick fix list using the ":copen" command

For documentaion about the ":make" in relation to dotnet see: "https://neovim.io/doc/user/quickfix.html#compiler-dotnet". One can add the options described in the documentation to Neovim as global defaults as done in the "./config/nvim/lua/config/globals.lua" where the following is set:

    - vim.g.dotnet_errors_only = true
    - vim.g.dotnet_show_project_file = false

## Connecting to a private NuGet feed
This used to be alot more difficult but is rather simple now thanks to the installation being self contained. Firstly, add the desired NuGet feed to the "$HOME/.nuget/NuGet/NuGet.Config" (if you want it globally). Then follow the guide at the Microsoft Artifact CredProvider ("https://github.com/microsoft/artifacts-credprovider") which essentially are:

    - Download the latest release from "https://github.com/Microsoft/artifacts-credprovider/releases" for the desired architecture

    - Unpack the content of the ".tar.gz" file

    - If not already present, create a "plugins" directory in the "$HOME/.nuget" folder

    - Copy the folder "netcore" from the unpacked ".tar.gz" file into the newly created "$HOME/.nuget/plugins/" directory

You should now be able to run dotnet restore and it will open a new tab for authentication in the browser.

# Python
I have not yet set up my Python development environment and might migrate to uv for managing packages and virtual environments.
