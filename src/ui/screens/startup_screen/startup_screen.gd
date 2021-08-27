extends Control

var loading = false

func _ready():
	if OS.get_cmdline_args().size() > 0:
		for arg in OS.get_cmdline_args():
			match arg:
				"MM":
					print("Game was started using MysteryMaker.\n")
					Globals.dev_mode = true
	yield(get_tree().create_timer(0.2), "timeout")
	$CenterContainer/EngineLogo/AnimationPlayer.play("startup")

func _on_AnimationPlayer_animation_finished(anim_name):
	Globals.scene_handler.open("page://home")
	#get_tree().change_scene("res://src/ui/screens/dialogue_view/dialogue_view.tscn")


# Method function does not work on parent scenes
func _process(delta):
	if $CenterContainer/EngineLogo/AnimationPlayer.current_animation:
		if $CenterContainer/EngineLogo/AnimationPlayer.current_animation_position > 0.7 && !loading:
			loading = true
			load_packs()

func load_packs():
	#if Globals.dev_mode:
	ThreadHandler.add_job(Velius, "import", [OS.get_environment("TEMP") + "/MysteryMaker/debug.zip"])
	#else:
	ThreadHandler.add_job(Velius, "import", [])
