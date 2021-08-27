extends Object

signal modules_ready(data)

var ready = false

var data = {
			title = "HOME"
		}

func _init():
	data.modules = get_modules()
	emit_signal("modules_ready", data)
	ready = true

func get_modules() -> Dictionary:
	var modules = {
		0:	{
				type = "dlc_library",
			},
		1:	{
				type = "divider",
			},
		2:	{
				type = "debug_library",
			}
		}
	return modules
