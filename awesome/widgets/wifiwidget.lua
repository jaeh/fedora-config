
-- Create a wifiwidget
-- It displays the SSID of the net you are connected to ( args["{ssid}"] ) and the percentage of connectivity ( args["{link}"] )
-- Initialize widget
wifiwidget = widget({ type = "textbox" })
	
-- Register widget
vicious.register(wifiwidget, vicious.widgets.wifi, function(widget, args)
	link = args["{link}"]
	
	-- if there is no wlan connected:
	if args["{ssid}"] == "N/A" then
		return "no net"
	end
	
	color = get_color_for_widgets(link, 
	{
		{color = "red", limit = 10},
		{color = "pink", limit = 20},
		{color = "yellow", limit = 40},
		{color = "lightgreen", limit = 60},
		{color = "green", limit = 80}
	})
	
	return ' <span color="' .. color .. '">' .. args["{ssid}"] .. " " .. args["{link}"] .. "%</span>"
	
end, 1, "wlan0") 

-- buttons for the wifi widget
wifiwidget:buttons(awful.util.table.join(
  awful.button({}, 1, function() 
	run_once("wicd-client")
  end) --Left click to open wicd-client, but becarefull to don't open it twice or more
))

return wifiwidget
