--My volume widget
volumewidget = widget({ type = "textbox" })
vicious.register(volumewidget, vicious.widgets.volume, "vol: $1%", 3, "Master")

--buttons for the volume widget, 
volumewidget:buttons(awful.util.table.join(
	awful.button({ }, 1, function () awful.util.spawn("gnome-alsamixer", true) end) --Left click to open alsamixer in a xterm
	--awful.button({ }, 3, function () 
		--awful.util.spawn("amixer -q sset Master toggle", false) 
	--end)    --Right click to mute/umute (I have the keybind modkey+F11 to do it too)
))

return volumewidget

