# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal
from scripts.lock_screen import lock_screen

mod = "mod4"
myTerm = guess_terminal()

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),
    ([mod], "n", lazy.normalize()),
    ([mod], "n", lazy.maximize()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Toggle full screen
    ([mod], "f", lazy.window.toggle_fullscren()),

    # Kill window
    ([mod, "shift"], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),
    ([mod], "w", lazy.to_screen(0)),
    ([mod], "e", lazy.to_screen(2)),
    ([mod], "r", lazy.to_screen(1)),

    # Lock screen, dependencies: xautolock, i3lock, imagemagick
    ([mod, "shift"], "x", lazy.function(lock_screen())),

    # Qtile control
    ([mod, "control"], "r", lazy.restart()),
    ([mod, "control"], "q", lazy.shutdown()),
    

    # ------------ App Configs ------------
    # Terminal
    ([mod], "Return", lazy.spawn(myTerm)),
    ([mod], "t", lazy.spawncmd()),

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod, "shift"], "Return", lazy.spawn("firefox")),

    # File Explorer
    ([mod, "shift"], "e", lazy.spawn("nautilus")),

    # Screenshot
    ([mod], "s", lazy.spawn("scrot")),
    ([mod, "shift"], "s", lazy.spawn("scrot -s -o /tmp/sct.png")),

    # ------------ Hardware Configs ------------
    
    # Keyboard layout
    ([mod], "space", lazy.widget["keyboardlayout"].next_keyboard()),

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer -D pulse set Master 5%-"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer -D pulse set Master 5%+"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "amixer -D pulse set Master toggle"
    )),

    # Brightness
#    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
#    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
