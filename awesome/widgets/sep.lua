
-- Initialize widget
sep = awful.widget.progressbar()
-- Progressbar properties
sep:set_width(1)
sep:set_height(18)
sep:set_vertical(true)
sep:set_color("#AECF96")
-- Register widget
vicious.register(sep, vicious.widgets.volume, 100, 100000 )

return sep.widget
