
-- Create a batwidget (status chrg%)

-- Initialize widget
batwidget = widget({ type = "textbox" })

-- Register widget
--Displays a plus or minus (charging or not){$1}, then the percentage of charge {$2}, and at the end 
--the time to finish the charge or discharge {$3}.
--Maybe you will have to change the BAT0 for BAT1, or BAT2... Try :)
vicious.register(batwidget, vicious.widgets.bat, 
	function(widget, args)
		-- battery is being charged:
		if args[1] == "+" then
			return '<span color="#00ffff">bat: </span>' .. args[2] .. '%'
		--battery gets discharged:
		elseif args[1] == "-" then
			return '<span color="#ff0000">bat: </span>' .. args[2] .. '%'
		else
			if args[2] >= 99 then
				--battery is full
				return '<span color="#FFF126">ॐ</span>'
			end
			return '<span color="#FFF126">' ..args[1].. args[2] ..'/ ' .. args[3] .. '</span>'
		end
	end, 
5, "BAT0")

return batwidget
