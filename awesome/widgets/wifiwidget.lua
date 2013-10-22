local wibox = require('wibox')
local vicious = require('vicious')
local awful = require("awful")
local naughty = require('naughty')
local beautiful = require('beautiful')

-- Create a wifiwidget
-- It displays the SSID of the net you are connected to ( args["{ssid}"] ) and the percentage of connectivity ( args["{link}"] )
-- Initialize widget
local wifiwidget = wibox.widget.textbox()

-- Register widget
vicious.register(wifiwidget, vicious.widgets.wifi, function(widget, args)
  link = args["{link}"]
  ssid = args["{ssid}"]

    -- if there is no wifi connected:
  if ssid == "N/A" then
    return "no net"
  end

  local color = "white"

  if link < 10 then
	color = beautiful.widgetcolors.red
  elseif link < 20 then
	color = "pink"
  elseif link < 40 then
	color = beautiful.widgetcolors.yellow
  elseif link < 60 then
	color = beautiful.widgetcolors.lightgreen
  elseif link < 80 then
	color = beautiful.widgetcolors.green
  end
 
  return '<span color="' .. color .. '">' .. ssid .. ' ' .. link .. '%</span>'

end, 10, "wlan1") 

local control_open = 0

wifiwidget:buttons(awful.util.table.join(
	awful.button({ }, 1, 
	function () 
		if control_open == 0 then
			control_open = 1
			awful.util.spawn("nm-applet")
		elseif control_open == 1 then
			control_open = 0
			awful.util.spawn("killall nm-applet")
		end
	end)
))

return wifiwidget
