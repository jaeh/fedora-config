local wibox = require('wibox')
local vicious = require('vicious')
local awful = require("awful")
local naughty = require('naughty')

-- Create a wifiwidget
-- It displays the SSID of the net you are connected to ( args["{ssid}"] ) and the percentage of connectivity ( args["{link}"] )
-- Initialize widget
local wifiwidget = wibox.widget.textbox()

-- Register widget
vicious.register(wifiwidget, vicious.widgets.wifi, function(widget, args)
  link = args["{link}"]
  ssid = args["{ssid}"]

  --~ 
  --~ for key,value in pairs(args) do 
      --~ naughty.notify({ 
        --~ preset = naughty.config.presets.critical,
        --~ title = "Battery is running low!",
        --~ text = 'key = ' .. key .. ' value = ' .. value
      --~ })
  --~ end

    -- if there is no wifi connected:
  if args["{ssid}"] == "N/A" then
    return "no net"
  end

  color = get_color_for_widgets(link, {
    {color = "red", limit = 10},
    {color = "pink", limit = 20},
    {color = "yellow", limit = 40},
    {color = "lightgreen", limit = 60},
    {color = "green", limit = 80}
  })

  return '<span color="' .. color .. '">' .. args["{ssid}"] .. ' ' .. link .. '%</span>'

end, 1, "wlan1") 
--~ 
--~ 
--~ is_running = false
--~ -- buttons for the wifi widget
--~ wifiwidget:buttons(awful.util.table.join(
  --~ awful.button({}, 1, function() 
  --~ if is_running == false then
    --~ is_running = true
    --~ run_once("nm-applet")
  --~ else
    --~ is_running = false
    --~ awful.util.spawn_with_shell("killall nm-applet")
  --~ end
  --~ end) --Left click to open or close nm-applet
--~ ))

return wifiwidget
