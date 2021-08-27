extends Control

const SCENE_PAGE = preload("res://src/ui/pages/page.tscn")
const SCENE_SIDEMENU = preload("res://src/ui/pages/side_menu/side_menu.tscn")
const PATH_OBJECTS = "res://src/ui/pages/page_objects/"

onready var tween = $Tween

enum TRANSITIONS {
	NONE,
	TO_LEFT,
	TO_RIGHT,
	FADE_ZOOM,
}

var scene_history : Array
var last_scene
var current_scene
var allowed_back : bool

var dialogue_view

func _ready():
	Globals.scene_handler = self
	open("res://src/ui/screens/startup_screen/startup_screen.tscn", TRANSITIONS.NONE, false)


# Scene Handler


func go_last(transition=TRANSITIONS.TO_RIGHT):
	if scene_history.size() <= 1:
		return
	if current_scene:
		last_scene = current_scene
	
	if allowed_back:
		scene_history.remove(scene_history.size() - 1)
	
	var new_scene_path = scene_history[scene_history.size() - 1]

	if "page://" in new_scene_path:
		var page_name = new_scene_path.to_lower().replace("page://", "")
		current_scene = SCENE_PAGE.instance()
		var page_obj = load(PATH_OBJECTS + page_name + ".gd").new()
		current_scene.init_page(page_obj)
	else:
		current_scene = load(new_scene_path).instance()
		
	add_child(current_scene)
	if last_scene:
		last_scene.set_process_input(false)
	start_tween(transition)

func open_dialogue_view(path : String, transition=TRANSITIONS.FADE_ZOOM):
	if current_scene:
		last_scene = current_scene

	allowed_back = false
	
	current_scene = load(path).instance()
	
	dialogue_view = current_scene
	
	add_child(current_scene)
	if last_scene:
		last_scene.set_process_input(false)
	
	current_scene.add_child(SCENE_SIDEMENU.instance())
	
	start_tween(transition)


func open(path : String, transition=TRANSITIONS.TO_LEFT, allow_back=true):
	if current_scene:
		last_scene = current_scene


	if allow_back:
		scene_history.append(path)
		allowed_back = true
	else:
		allowed_back = false

	# If page
	if "page://" in path:
		var page_name = path.to_lower().replace("page://", "")
		current_scene = SCENE_PAGE.instance()
		var page_obj = load(PATH_OBJECTS + page_name + ".gd").new()
		current_scene.init_page(page_obj)
	# If Scene
	else:
		current_scene = load(path).instance()
	
	add_child(current_scene)
	if last_scene:
		last_scene.set_process_input(false)
	
	start_tween(transition)

func open_side_menu():
	if dialogue_view.has_node("SideMenu"):
		dialogue_view.get_node("SideMenu").open()


# Animations

func start_tween(transition):
	match transition:
		TRANSITIONS.TO_RIGHT:
			tween.interpolate_property(current_scene, "rect_position", - Vector2(current_scene.rect_size.x, 0), Vector2.ZERO, 0.8, Tween.TRANS_EXPO, Tween.EASE_OUT)
			tween.interpolate_property(last_scene, "rect_position", Vector2.ZERO, 2 * Vector2(current_scene.rect_size.x, 0), 0.8, Tween.TRANS_EXPO, Tween.EASE_OUT)
			
			#tween.interpolate_property(current_scene, "modulate:a", 0, 1, 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
			#tween.interpolate_property(last_scene, "modulate:a", 1, 0, 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		TRANSITIONS.TO_LEFT:
			tween.interpolate_property(current_scene, "rect_position", 2 * Vector2(current_scene.rect_size.x, 0), Vector2.ZERO, 0.8, Tween.TRANS_EXPO, Tween.EASE_OUT)
			tween.interpolate_property(last_scene, "rect_position", Vector2.ZERO, - Vector2(current_scene.rect_size.x, 0), 0.8, Tween.TRANS_EXPO, Tween.EASE_OUT)
			
			#tween.interpolate_property(current_scene, "modulate:a", 0, 1, 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
			#tween.interpolate_property(last_scene, "modulate:a", 1, 0, 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	
		TRANSITIONS.FADE_ZOOM:
			last_scene.rect_pivot_offset = Vector2(rect_size.x, rect_size.y) / 2
			current_scene.rect_pivot_offset = Vector2(rect_size.x, rect_size.y) / 2
			
			tween.interpolate_property(current_scene, "modulate:a", 0, 1, 0.4, Tween.TRANS_EXPO, Tween.EASE_OUT)
			tween.interpolate_property(current_scene, "rect_scale", Vector2.ONE/1.2, Vector2.ONE,  0.6, Tween.TRANS_EXPO, Tween.EASE_OUT)
			
			# Because set_process_input(false) does not work -> scale to zero
			tween.interpolate_property(last_scene, "rect_scale", Vector2.ZERO, Vector2.ZERO,  0, Tween.TRANS_EXPO, Tween.EASE_OUT, 0.6)
			
	tween.start()


func _on_Tween_tween_started(object, key):
	for child in get_children():
		if child != last_scene && child != current_scene && child != tween && child != $WorldEnvironment:
			child.queue_free()

# Events

func _unhandled_key_input(event):
	if Input.is_action_just_pressed("refresh") && Globals.dev_mode:
		Velius.start_mystery(Velius.current_json_location, Velius.current_mystery_id)
