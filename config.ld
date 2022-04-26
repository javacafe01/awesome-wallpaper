
-- Configuration file for ldoc

project = 'awesome-wallpaper'
title = 'Awesome WM Wallpaper Maker'

all = false
dir = 'doc'
format='markdown'
pretty = 'lua'
prettify_files = true
backtick_references = true
merge = true
use_markdown_titles = true
wrap = true
sort_modules = true
not_luadoc = true
style = '!new'


-- Define some new ldoc tags from the AwesomeWM doc
new_type("staticfct", "Static functions", false, "Parameters")
new_type("constructorfct", "Constructor", false, "Parameters")
new_type("method", "Object methods", false, "Parameters")
new_type("property", "Object properties", false, "Type")
new_type("signal", "Signals", false, "Arguments")
