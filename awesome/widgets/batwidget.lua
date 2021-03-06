local wibox = require('wibox')
local vicious = require('vicious')
local awful = require('awful')
local naughty = require('naughty')
local beautiful = require('beautiful')

-- Create a batwidget (status chrg%)

-- Initialize widget
local batwidget = wibox.widget.textbox()

-- Register widget
--Displays a plus or minus (charging or not){$1}, then the percentage of charge {$2}, and at the end 
--the time to finish the charge or discharge {$3}.
--Maybe you will have to change the BAT0 for BAT1, or BAT2... Try :)

local notified = false
local notifypercent = 12
local notifypercentstep = 2


vicious.register(batwidget, vicious.widgets.bat,
    function(widget, args)
        loadState = args[1]
        loadPercent = args[2]
        
        if loadPercent >= 98 then
            --battery is full
            return '<span color="' .. beautiful.widgetcolors.yellow .. '">ॐ</span>'
        end
        
        
        -- battery is almost empty
        if loadState == '-' then

            if loadPercent <= 3 then
				suspend()
            
            elseif loadPercent <= notifypercent then
                np = notifypercent - notifypercentstep
                if np >= loadPercent then
                    notifypercent = np

                    naughty.notify({ preset = naughty.config.presets.critical,
                                     title = "Battery is running low!",
                                     text = 'Remaining: ' .. loadPercent,
                                     timeout = 10})
                end
            end
        elseif loadState == '+' then
            notifypercent = 12
        end		

        -- battery is being charged:
        if loadState == "+" then
            if loadPercent < 50 then
				color = beautiful.widgetcolors.green
			else 
				color = beautiful.widgetcolors.lightgreen
			end
        --battery gets discharged:
        elseif loadState == "-" then
			if loadPercent < 20 then
				color = beautiful.widgetcolors.red
			else
				color = beautiful.widgetcolors.yellow
			end
        end

        return '<span color="' .. color .. '">bat: </span>' .. loadPercent .. '%'
    end, 
5, "BAT0")

batwidget:buttons(awful.util.table.join(
	awful.button({ }, 3, 
	function ()
		suspend()
	end)
))

function suspend ()
  awful.util.spawn("/usr/bin/systemctl suspend")
end

return batwidget
