--Init 		
thermwidget = widget({ type = "textbox" })
-- Register
vicious.register(thermwidget, vicious.widgets.thermal, "$1°", 19, "thermal_zone0")

return thermwidget
