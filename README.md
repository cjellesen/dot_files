# dot_files

This is a compilation of my private dot files for linux setup. This is currently for an arch build running with hyprland as its composite.
Use the Sol Does Tech guide for how to install the system initially and override the ~/.config/hypr/ with the one in the repository.

For Neovim, use the install procedure outline for the "NVCHAD" project. 
Once installed override the relevant files and folders in ~/.config/nvim/ with the content of the nvim directory in the repository.

Program installations:

    - In order for the Mason plugin (plugin manager for Neovim) to function the system need to have npm installed.
        - To install npm first install its dependency, nodejs, and then proceed to install npm.

    - Python version manager:
        - use pacman to install pyenv and follow the guides from their github for how to config ~/.bashrc etc.
        - Install pyenv-virutalenv by following the install guides on their github repo along with the config of ~/.bashrc.
        - Once finished reboot the system, just to be sure and "pyenv" along with "pyenv virutalenv" can now be used to download and configure virtual environments.
   

