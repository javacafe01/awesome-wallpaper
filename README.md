<div align=center>

<img src="https://imgur.com/wpPf4wQ.gif" />

</div>

# awesome-wallpaper

This is a simple AwesomeWM themed wallpaper generator. The module generates wallpapers with the word *AwesomeWM* in a cool font.

**Note:** This module requires the up-to-date version of AwesomeWM from the master branch.

## Installation

To install, clone this repository into your AwesomeWM configuration folder. 

For example:
```bash
git clone https://github.com/JavaCafe01/awesome-wallpaper.git ~/.config/awesome/awesome-wallpaper
```

You will also need [this font](https://awesomewm.org/recipes/awesomewm-font.ttf). Place it in `~/.local/share/fonts`.

## Usage

```lua
-- Load the module
local awesome_wallpaper = require("awesome-wallpaper")

-- Create the wallpaper instance and set your options
local wallpaper = awesome_wallpaper {

    -- These are all the options available and the default values
    
    -- The background color of the wallpaper
    background_color = "#10171e",
    -- The colors of the letters in order
    letter_colors = {
        "#fca2aa", "#F8BD96", "#fbeab9", "#9ce5c0", "#c7e5d6", "#bac8ef",
        "#d7c1ed", "#3b4b58", "#3b4b58"
    },
    -- The font size
    font_size = 50,
    -- If the letters should be colored in or not
    solid_letters = true,
    -- Letter spacing
    spacing = 15
}

-- Draw the wallpaper
wallpaper:draw_wallpaper()
```

### Fun Snippets

This piece of code animates the wallpaper to increase and decrease in size like the header gif!

```lua
local wall = require("awesome-wallpaper")

local g = require('gears').timer {
    timeout = 0.01,
    call_now = false,
    autostart = true
}

local size = 2
local factor = 1
g:connect_signal("timeout", function()
    if size >= 30 or size <= 1 then factor = factor * -1 end
    wall = wall {font_size = size}
    wall:draw_wallpaper()
    size = size + (1 * factor)
end)
```

<details>
<summary><h3>Screenshots</h3></summary>
<br>
<img src="https://imgur.com/Ov7PAiu.png" />
<img src="https://imgur.com/w6UG5Rc.png" />
<img src="https://imgur.com/yzXTYJH.png" />
</details>
