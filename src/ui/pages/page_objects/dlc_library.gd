extends Object

signal modules_ready(data)

var ready = false

var data = {
			title = "DLC LIBRARY",
			back = "page://home",
			btn_icon = "reload"
		}

func _init():
	for item in Globals.IMPORTED:
		if Globals.IMPORTED[item].import_type == "dlc":
			_loaded()
			return
	
	ThreadHandler.add_job(Velius,
						"import",
							  [],
					   "_loaded",
							self,
							1)

func _loaded():
	data.modules = get_modules()
	ready = true
	emit_signal("modules_ready", data)
	
func get_modules() -> Dictionary:
	var modules = {}
	
	var i = 0
	for item in Globals.IMPORTED:
		var id = item
		item = Globals.IMPORTED[item]
		
		if item.import_type != "dlc":
			continue
		
		modules[i] = {
			type = "mystery_entry",
			data = {
					title = item.name,
					key = id
				}
			}
		i += 1
		modules[i] = {
				type = "divider"
			}
		i += 1
	
	#Remove last divider
	modules.erase(modules.size() - 1)
	
	return modules

func _action_button_clicked(page_obj):
	if ready:
		ready = false
		page_obj.clear_modules()
		ThreadHandler.add_job(Velius,
							"import",
								  [],
						   "_loaded",
								self,
								0)
