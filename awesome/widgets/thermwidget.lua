--Init 		
thermwidget = widget({ type = "textbox" })
-- Register
vicious.register(thermwidget, vicious.widgets.thermal, 
	function (widget, args)
		if vicious.showhide == true then
			bla = ""
			for i,v in ipairs(args) do 
				if i == 1 then
					bla = v 
				end
			end
			
			return bla .. 'C '
		end
	end, 
20, "thermal_zone0")

return thermwidget
