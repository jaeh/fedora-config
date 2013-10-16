-- Create a cpuwidget (usage%)

-- A widget who displays the percentage of CPU usage :)
-- The vicious.widgets.cpu return three variables, $1 is the percentage total usage.
-- $2 is the percentage of the first CPU usage, and $3 is the percentage of the second CPU usage.
-- I just use the first one, you can put all you want.
local wibox = require("wibox")
local vicious = require("vicious")
local ipairs = ipairs

-- Initialize widget
cpuwidget = wibox.widget.textbox()
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, function(widget,args)
  local value = ""

  if vicious.showhide == true then
    for i,v in ipairs(args) do 
      if i == 5 then
        value = 'cpu: ' .. v .. '%'
      end
    end
  end
  return value
end, 3)

return cpuwidget
