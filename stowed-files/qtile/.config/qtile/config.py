# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
import os
import subprocess

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

from libqtile import hook
from typing import List  # noqa: F401

# My variables
mod = "mod4"
alt = "mod1"
myTerm = "alacritty"
myBrowser = "firefox-developer-edition"
myLauncher = "rofi -show run"
myTwitchChat = "alacritty tc connect iamL2"

nordColor1 = "#81a1c1"
nordColor2 = "#434c5e"
nordColor3 = "#3b4252"
nordColor4 = "#2e3440"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    # Moving windows inside the stack
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    
    # Flipping windows
    Key([mod, alt], "j", lazy.layout.flip_down()),
    Key([mod, alt], "k", lazy.layout.flip_up()),
    Key([mod, alt], "h", lazy.layout.flip_left()),
    Key([mod, alt], "l", lazy.layout.flip_right()),

    # Resizing windows (careful when in Windows VM)
    # Key([mod], "h", lazy.layout.shrink_main()),
    # Key([mod], "l", lazy.layout.grow_main()),
    Key([mod, "control"], "j", 
        lazy.layout.grow_down(),
        lazy.layout.shrink()
        ),
    Key([mod, "control"], "k", 
        lazy.layout.grow_up(),
        lazy.layout.grow()
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_main(),
        lazy.layout.grow_left()
        ),
    Key([mod, "control"], "l",
        lazy.layout.shrink_main(),
        lazy.layout.grow_right()
        ),
    Key([mod, "control"], "n", lazy.layout.normalize()),
    Key([mod, "control"], "m", lazy.layout.maximize()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.next_screen()),
    Key([mod, "shift"], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, alt], "space", 
        lazy.layout.rotate(), 
        lazy.layout.flip()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),

    # Toggle between different layouts as defined below
    Key([mod, "shift"], "Tab", lazy.prev_layout()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "q", lazy.window.kill()),

    # Applications launching
    Key([mod], "r", lazy.spawn(myLauncher)),
    Key([mod, "shift"], "r", lazy.spawncmd()), 
    Key([mod], "q", lazy.spawn(myTerm)),
    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "Home", lazy.spawn(myBrowser)),
    Key([mod], "t", lazy.spawn(myBrowser)),
    Key([mod], "End", lazy.spawn(myTwitchChat)),
    
    # QTile control
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
]

groups = [Group(i) for i in "asdfuiop"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),
         # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layout_theme = {
        "border_width": 3,
        "margin": 8,
        "border_focus": "8fbcbb",
        "border_normal": "4c566a"
        }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Stack(num_stacks=2, **layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
    layout.Zoomy(**layout_theme)
]

widget_theme = {
        "font": 'FiraCode Nerd Font',
        "fontsize": 16,
        "background": nordColor3,
        "foreground": nordColor1,
        "fontshadow": nordColor4,
        "padding": 5 
        }

widget_defaults = dict(
    font='RobotoMono Nerd Font',
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

# Defining default bar array
def init_minimal_widgets():
    minimal_widgets = []
    minimal_widgets.extend([
        widget.GroupBox(
            active=nordColor1,
            this_current_screen_border="8fbcbb",
            this_screen_border="4c566a",
            inactive=nordColor2,
            **widget_theme
            ),
        widget.Prompt(
            **widget_theme
            ),
        widget.WindowName(
            **widget_theme
            ),
        widget.CurrentLayout(fmt='[{}]', **widget_theme),
        widget.WindowCount(
            text_format='[win_open: {num}]',
            **widget_theme
            )
        ])
    return minimal_widgets

# More information on the main bar
extra_widgets = [
    widget.Memory(
        format='[mem_usage: {MemUsed: .0f}MB]',
        **widget_theme
        ),
    widget.CPU(
        format='[cpu_usage: {load_percent}]',
        **widget_theme
        ),
    widget.WidgetBox(
        widgets = [
                widget.Systray(
                    **widget_theme
                )
        ],
        **widget_theme
        ),
    widget.Clock(
        fmt='[{}]',
        format='%Y-%m-%d %a %I:%M %p',
        **widget_theme
        ),
]

# Creating main bar
def get_mainbar_widgets():
    mainbar_widgets = init_minimal_widgets()
    mainbar_widgets.extend(extra_widgets)
    return mainbar_widgets

def get_otherbar_widgets():
    otherbar_widgets = init_minimal_widgets()
    return otherbar_widgets

def init_bars_with_margins(widgets):
    return bar.Bar(widgets, opacity=0.5, size=28, margin=[10, 7, 3, 7]) # N E S W

# Wrapping main screen bar
main_screen_bar = init_bars_with_margins(get_mainbar_widgets())
# Wrapping secondary screen bar
other_screen_bar = init_bars_with_margins(get_otherbar_widgets())

screens = [
    Screen(
       top=main_screen_bar,
    ),
    Screen(
       top=other_screen_bar,
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.screen_change
def restart_on_sceen_change(qtile, ev):
    qtile.cmd_restart()
    
@hook.subscribe.startup
def autostart_alyways():
    home = os.path.expanduser('~/.config/qtile/autostart_always.sh')
    subprocess.call([home])

@hook.subscribe.startup_once
def autostart_once():
    home = os.path.expanduser('~/.config/qtile/autostart_once.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
