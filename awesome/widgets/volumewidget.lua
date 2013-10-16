local wibox = require("wibox")
local vicious = require("vicious")
local awful = require("awful")

--My volume widget
local volumewidget = wibox.widget.textbox()

vicious.register(volumewidget, vicious.widgets.volume, "vol: $1%", 3, "Master")

return volumewidget
