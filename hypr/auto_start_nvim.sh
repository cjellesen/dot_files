#!/bin/bash

hyprctl keyword windowrule "workspace 6 silent,^(kitty)$"
hyprctl dispatch exec kitty nvim
sleep 1
hyprctl keyword windowrule "workspace unset, kitty"
