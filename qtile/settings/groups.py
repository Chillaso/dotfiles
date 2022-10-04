# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.lazy import lazy
from .keys import mod, keys


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons: 
# nf-fa-firefox, 
# nf-mdi-monitor, 
# nf-dev-terminal, 
# nf-fa-code, 
# nf-mdi-message, 
# nf-mdi-spotify,
# nf-mdi-coffee, 
# nf-mdi-vpn

groups = [Group(i) for i in [
    "   ", "   ", "   ", "   ", "   ", " 阮  ", "   ", " 嬨  ", "   ",
]]

def toscreen(qtile, group_name):
    if group_name  == qtile.current_screen.group.name:
        return qtile.current_screen.set_group(qtile.current_screen.previous_group)
    for i, group in enumerate(qtile.groups):
        if group_name == group.name:
            return qtile.current_screen.set_group(qtile.groups[i])

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        #Key([mod], actual_key, lazy.group[group.name].toscreen()),
        Key([mod], actual_key, lazy.function(toscreen, group.name)),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
