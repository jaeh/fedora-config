
-- Create a showhidewidget
-- It displays the SSID of the net you are connected to ( args["{ssid}"] ) and the percentage of connectivity ( args["{link}"] )
-- Initialize widget
showhidewidget = widget({ type = "textbox" })

vicious.showhide = false
vicious.showhidetext = "more"

-- Register widget
vicious.register(showhidewidget, vicious.widgets.wifi, 
	function(widget, args)
		if vicious.showhide == true then
			return "less"
		end
		
		return "more"
	end, 
	1000, "wlan0") 

-- buttons for the wifi widget
showhidewidget:buttons(awful.util.table.join(
  awful.button({}, 1, function() 
	  	
	if vicious.showhide == false then
		vicious.showhide = true
		vicious.showhidetext = "less"
		vicious.widgetspeed = 1
	else
		vicious.showhide = false
		vicious.showhidetext = "more"
		vicious.widgetspeed = 10000
	end
	
	vicious.force({cpuwidget}) 	
	vicious.force({memwidget}) 	
	vicious.force({thermwidget}) 
	vicious.force({showhidewidget}) 
	vicious.force({wifiwidget}) 
			
  end) --Left click to open or close nm-applet
))

return showhidewidget
