
-- Create a batwidget (status chrg%)

-- Initialize widget
batwidget = widget({ type = "textbox" })

-- Register widget
--Displays a plus or minus (charging or not){$1}, then the percentage of charge {$2}, and at the end 
--the time to finish the charge or discharge {$3}.
--Maybe you will have to change the BAT0 for BAT1, or BAT2... Try :)

notified = false
notifypercent = 10
notifypercentstep = 2

vicious.register(batwidget, vicious.widgets.bat,
    function(widget, args)
        -- battery is almost empty
        if args[1] == '-' then

            if args[2] <= 3 then
                awful.util.spawn_with_shell('dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend')
            
            elseif args[2] <= notifypercent then
                np = notifypercent - notifypercentstep
                if np >= args[2] then
                    notifypercent = np

                    naughty.notify({ preset = naughty.config.presets.critical,
                                     title = "Battery is running low!",
                                     text = ''})
                end
            end
        end
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
