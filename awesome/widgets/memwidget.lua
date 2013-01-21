--~ memory widget, shows percentage of total memory thats being used atm
local ipairs = ipairs

memwidget = widget({ type = "textbox" })

vicious.register(memwidget, vicious.widgets.mem, 
	function (widget, args)
		
		if vicious.showhide == true then
			bla = ""
			for i,v in ipairs(args) do 
				if i == 1 then
					bla = v 
				end
			end
			
			return 'mem: ' .. bla .. '% '
		end
	end, 3)

return memwidget
