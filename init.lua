--------------------------------------------------------------------------
-- A simple AwesomeWM themed wallpaper generator.
--
--
-- @author JavaCafe01
-- @copyright 2022 JavaCafe01
---------------------------------------------------------------------------
local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local setmetatable = setmetatable

--- The wallpaper Module
local awesome_wallpaper = {}
local mt = {}

--- Helper function that creates a textbox that will hold one letter of `AwesomeWM`
--
-- @tparam string letter the string character needed to be widgetized
-- @tparam string color the color of the string character
-- @tparam number font_size the font size of the letter
-- @treturn wibox.widget.textbox The textbox widget with a single letter beautified
local function create_letter_wibox(letter, color, font_size)
    return wibox.widget {
        font = "awesomewm-font " .. font_size,
        markup = "<span foreground='" .. color .. "'>" .. letter .. "</span>",
        widget = wibox.widget.textbox
    }
end

--- The awesome-wallpaper constructor.
--
-- @tparam table args Arguments table
-- @tparam[opt] string args.background_color The background color of the wallpaper.
-- @tparam[opt] table args.letter_colors A table of colors, in order, used to colorize the word *AwesomeWM*.
-- @tparam[opt] number args.font_size The font size of the letters.
-- @tparam[opt] boolean args.solid Whether or not the letters should be solid.
-- @tparam[opt] number args.spacing The spacing between the letters.
-- @treturn awesome-wallpaper The awesome-wallpaper instance.
-- @constructorfct awesome-wallpaper.new
function awesome_wallpaper.new(self, args)
    local args = gears.table.crush({
        background_color = "#10171e",
        letter_colors = {
            "#fca2aa", "#F8BD96", "#fbeab9", "#9ce5c0", "#c7e5d6", "#bac8ef",
            "#d7c1ed", "#3b4b58", "#3b4b58"
        },
        font_size = 50,
        solid_letters = true,
        spacing = 15
    }, args or {})

    local uppercase_letters = "AWESOMEWM"
    local lowercase_letters = string.lower(uppercase_letters)

    local bg_color = args.background_color
    local letter_colors = args.letter_colors
    local font_size = args.font_size
    local solid = args.solid_letters
    local spacing = args.spacing

    local letters = solid and uppercase_letters or lowercase_letters

    local word_widget = wibox.layout.fixed.horizontal()
    word_widget.spacing = spacing

    for i = 1, #letters do
        local c = letters:sub(i, i)
        word_widget:add(create_letter_wibox(c, letter_colors[i], font_size))
    end

    self.word_widget = word_widget
    self.bg_color = bg_color

    return self
end

--- Function that creates the wallpaper
--
-- @tparam awesome_wallpaper self The awesome-wallpaper instance.
function awesome_wallpaper.draw_wallpaper(self)
    screen.connect_signal("request::wallpaper", function(s)
        awful.wallpaper {
            screen = s,
            bg = self.bg_color,
            widget = wibox.widget {
                self.word_widget,
                valign = "center",
                halign = "center",
                widget = wibox.container.place
            }
        }
    end)
end

function mt.__call(self, ...) return awesome_wallpaper:new(...) end

return setmetatable(awesome_wallpaper, mt)
