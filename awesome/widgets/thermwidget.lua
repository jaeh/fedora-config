local wibox = require("wibox")
local vicious = require("vicious")
local ipairs = ipairs

--Init    
local thermwidget = wibox.widget.textbox()
local naughty = require("naughty")

vicious.register(thermwidget, vicious.widgets.thermal,
  function (widget, args)
    local value = ""

    if vicious.showhide == true then

      for i,v in ipairs(args) do 
        value = i
        if i == 1 then
          value = v .. 'C'
        end
      end
    end

    return value
  end, 
20, "thermal_zone0")

return thermwidget
