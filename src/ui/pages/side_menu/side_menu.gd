extends Control

func _ready():
	self.rect_global_position = Vector2( - 1440, 0)
	$HBoxContainer/Panel.get("custom_styles/panel").shadow_color.a = 0
	VisualServer.canvas_item_set_z_index(self.get_canvas_item(), 9999)	# Not working

func open():
	self.show()
	$Tween.interpolate_property(self, "rect_global_position", self.rect_global_position, Vector2(0, 0), 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.interpolate_property($HBoxContainer/Panel, "custom_styles/panel:shadow_color:a", $HBoxContainer/Panel.get("custom_styles/panel").shadow_color.a, 1, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.start()

func close():
	$Tween.interpolate_property(self, "rect_global_position", self.rect_global_position, Vector2( - rect_size.x, 0), 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.interpolate_property($HBoxContainer/Panel, "custom_styles/panel:shadow_color:a", $HBoxContainer/Panel.get("custom_styles/panel").shadow_color.a, 0, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.start()

func _on_SideMenuButton3_pressed():
	pass # Replace with function body.


func _on_SideMenuButton_pressed():
	pass # Replace with function body.


func _on_SideMenuButton4_pressed():
	pass # Replace with function body.

func _on_SideMenuButton2_pressed():
	Globals.scene_handler.go_last()


func _on_Control_gui_input(event):
	if Input.is_action_just_pressed("click"):
		close()


func _on_SideMenuButton5_pressed():
	pass # Replace with function body.
