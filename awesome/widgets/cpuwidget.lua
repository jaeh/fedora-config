-- Create a cpuwidget (usage%)

-- A widget who displays the percentage of CPU usage :)
-- The vicious.widgets.cpu return three variables, $1 is the percentage total usage.
-- $2 is the percentage of the first CPU usage, and $3 is the percentage of the second CPU usage.
-- I just use the first one, you can put all you want.

local ipairs = ipairs

-- Initialize widget
cpuwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, function(widget,args)
	if vicious.showhide == true then
	
		bla = ""
		for i,v in ipairs(args) do 
			if i == 5 then
				bla = v 
			end
		end
		
		return 'cpu: ' .. bla .. '% '

	end
end, 3)

return cpuwidget
