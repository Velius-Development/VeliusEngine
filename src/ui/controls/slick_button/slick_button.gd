extends NinePatchRect

signal held
signal pressed

# Without cooldown _on_SlickButton_gui_input gets called twice, idk why
var cooldown = 0

func _on_SlickButton_gui_input(event):
	if Input.is_action_just_pressed("click"):
		$AnimationPlayer.play("down")
		emit_signal("held")
	elif Input.is_action_just_released("click"):
		if !check_hover() || cooldown != 0:
			return
		$AnimationPlayer.play("up")
		emit_signal("pressed")
		cooldown = 100

func check_hover():
	var rect_check = Rect2(Vector2(0,0), self.get_global_rect().size)
	var local_mouse_pos = self.get_local_mouse_position()
	if !rect_check.has_point(local_mouse_pos):
		$AnimationPlayer.playback_speed = 0.2 
		$AnimationPlayer.play_backwards("down")
		return false
	else:
		return true

func _physics_process(delta):
	if cooldown > 0:
		cooldown -= 1

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.playback_speed = 1
