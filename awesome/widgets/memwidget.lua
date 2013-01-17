--~ memory widget, shows percentage of total memory thats being used atm
memwidget = widget({ type = "textbox" })
vicious.register(memwidget, vicious.widgets.mem, "mem: $1%", 13)

return memwidget
