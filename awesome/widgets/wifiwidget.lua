-- Create a wifiwidget
-- It displays the SSID of the net you are connected to ( args["{ssid}"] ) and the percentage of connectivity ( args["{link}"] )
-- Initialize widget
wifiwidget = widget({ type = "textbox" })

-- Register widget
vicious.register(wifiwidget, vicious.widgets.wifi, function(widget, args)
	if vicious.showhide then
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

		return ' <span color="' .. color .. '">' .. args["{ssid}"] .. " " .. args["{link}"] .. "%</span>     "
	end
end, 20, "wlan0") 


is_running = false
-- buttons for the wifi widget
wifiwidget:buttons(awful.util.table.join(
  awful.button({}, 1, function() 
	if is_running == false then
		is_running = true
		run_once("nm-applet")
	else
		is_running = false
		awful.util.spawn_with_shell("killall nm-applet")
	end
  end) --Left click to open or close nm-applet
))

return wifiwidget
