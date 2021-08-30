extends Control

const MODULES_PATH = "res://src/ui/pages/modules/"

var page_obj

var data : Dictionary setget set_data, get_data

func set_data(val):
	data = val
	page_obj.data = val

func get_data():
	data = page_obj.data
	return page_obj.data

func init_page(page_obj : Object):
	self.page_obj = page_obj
	page_obj.connect("modules_ready", self, "_on_modules_ready")
	if page_obj.ready:
		_on_modules_ready(page_obj.data)
	data = page_obj.data
	
	if Globals.scene_handler.scene_history.size() <= 1 && !data.has("back") || data.has("flags") && data.flags.has("no_back"):
		$SlickButton.hide()
	
	if !data.has("btn_icon"):
		$SlickButton2.hide()

	$Panel/Label.text = data.title
	$Panel/Label.get("custom_fonts/font").size = 150 - data.title.length() * 3
	

func _on_modules_ready(data):
	$CenterContainer/Label.hide()
	var delay = 0
	for module in data.modules:
		load_module(data.modules[module], delay)
		delay += 0.08
	$Tween.call_deferred("start")


func load_module(module, delay):
	var inst = load(MODULES_PATH + module.type + "/" + module.type + ".tscn").instance()
	if inst.has_method("init_data"):
		inst.init_data(module.data)
	inst.modulate.a = 0
	inst.rect_scale = Vector2(0.9, 0.9)
	$SmoothScroll/VBoxContainer.add_child(inst)
	$Tween.interpolate_property(inst, "modulate:a", 0, 1, 1, Tween.TRANS_EXPO, Tween.EASE_OUT, delay)
	$Tween.interpolate_property(inst, "rect_scale", Vector2(0.9, 0.9), Vector2.ONE, 1, Tween.TRANS_EXPO, Tween.EASE_OUT, delay)

func get_modules():
	var children = []
	for child in $SmoothScroll/VBoxContainer.get_children():
		children.append(child)
	return children

func clear_modules():
	for module in get_modules():
		module.queue_free()
	$CenterContainer/Label.show()

func _on_SlickButton_pressed():
	if data.has("back"):
		Globals.scene_handler.scene_history.remove(Globals.scene_handler.scene_history.size() - 1)
		Globals.scene_handler.open(data.back, Globals.scene_handler.TRANSITIONS.TO_RIGHT, false)
	else:
		Globals.scene_handler.go_last()


func _on_SlickButton2_pressed():
	if page_obj.has_method("_action_button_clicked"):
		page_obj.call("_action_button_clicked", self)
