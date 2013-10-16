--~ memory widget, shows percentage of total memory thats being used atm
local wibox = require('wibox')
local vicious = require('vicious')

memwidget = wibox.widget.textbox()

vicious.register(memwidget, vicious.widgets.mem, function(widget,args)
  local value = ""

  if vicious.showhide == true then
    for i,v in ipairs(args) do 
      if i == 1 then
        value = 'mem: ' .. v .. '% '
      end
    end
  end
  return value
end, 5)

return memwidget
