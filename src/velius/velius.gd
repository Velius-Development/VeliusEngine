extends Node

###############################################################################
#                                  VELIUS ENGINE                              #
###############################################################################





##############################
# SIGNALS:

# Called when a new dialogue is fired
# Returns a Dictionary
signal new_dialogue(data)

##############################
# VARIABLES:

# Contains the current dialogue
var next = {} setget set_next

var json_data = {}
var current_json_path = ""
var current_json_location = ""
var current_chapter_id : int
var current_dialogue_id : int
var current_location_id : int

##############################
# SET/GET-TERS

func set_next(new_next : Dictionary) -> void:
	next = new_next
	if next.type == "dialogue":
		run_dialogue(next)
	elif next.type == "location":
		run_location(next)

##############################
# VARIABLE SAVING API

# TODO: IMPLEMENT

##############################
#  FUNCTION OVERRIDES

func _ready() -> void:
	# Prevents closing on pressing close
	get_tree().set_auto_accept_quit(false)

	# Create DLC and temp directories
	# Remove junk debug files
	var dir = Directory.new()
	if !dir.dir_exists("user://DLC"):
		dir.make_dir("user://DLC")
	if !dir.dir_exists("user://temp"):
		dir.make_dir("user://temp")
	for item in Funcs.list_files_in_directory("user://temp"):
		dir.remove("user://temp/" + item)
	
	# Stop processing the script until mystery processing
	set_process(false)

func _notification(what) -> void:
	# On close: Remove old debug files
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		var dir = Directory.new()
		for item in Funcs.list_files_in_directory("user://temp"):
			dir.remove("user://temp/" + item)
		get_tree().quit()

##############################
# TODO: FIND TITLE

# Returns Dictionary containing
# the dialogue's data
# If id not found: returns empty Dictionary
func get_dialogue_by_id(id : int) -> Dictionary:
	for chapter in json_data:
		if chapter == str(current_chapter_id):
			for dialogue in json_data[chapter]["dialogues"]:
				if dialogue == str(id):
					return json_data[chapter]["dialogues"][dialogue]
	return {}

# Returns a choice's action string
func get_action(id : int) -> String:
	return json_data[str(current_chapter_id)]["dialogues"][str(current_dialogue_id)]["choices"][str(id)]["action"]

##########################################
### MESSAGE SYSTEM

# Loads a Mystery's data and theme
# After loading the given chapter will get displayed
func start_chapter(json_path : String, chapterID : int) -> void:
	# Update new json path
	current_json_location = json_path

	# Opens Theme.tscn
	Globals.scene_handler.open_dialogue_view(current_json_location + "/theme/Theme.tscn", Globals.scene_handler.TRANSITIONS.FADE_ZOOM)
	yield(get_tree().create_timer(0.1), "timeout")
	
	# Load mystery's data
	var data = Funcs.read_json(Globals.IMPORTED[json_path].json)
	json_data = data
	
	# Set intial starting point
	current_chapter_id = chapterID
	current_dialogue_id = 0
	set_next(get_dialogue_by_id(0))

	set_process(true)

# Runs a dialogue with the given data
# Replaces all '@'-variables with their string value
func run_dialogue(data : Dictionary) -> void:
	var final_text = data.text
	while final_text.find("@") != -1: # does it have at least one call for variable?
		var p = final_text.find("@")
		var s = final_text.find("@", p+1)
		var part = final_text.substr(p, s-p+1)
		var ev = final_text.substr(p+1, s-p-1)
		final_text = final_text.replace(part, str(evaluate_value(ev)))
	emit_signal("new_dialogue", data)
	

# Run location view
# TODO: Implement
func run_location(l : Dictionary) -> void:
	pass


# Jumps to the next dialogue
# TODO: Implement
func go_next() -> void:
	pass

# Ends the mystery processing
func end() -> void:
	current_dialogue_id = -1
	current_location_id = -1
	current_chapter_id = -1
	current_json_path = ""
	set_process(false)

###############################################################################
# API
###############################################################################

# Go to current chapter's dialogue with given id
func go(id : int) -> void:
	set_next(get_dialogue_by_id(id))

# Switches to chapter with given id
# and directly jumps to given dialogue_id
func go_chapter(chapter_id : int, dialogue_id = 0) -> void:
	current_chapter_id = chapter_id
	current_dialogue_id = dialogue_id

# Called when player made a choice
# Runs the selected choice's script
func choice_made(id : int) -> void:
	Scripts.run(get_action(id))

# Opens the side menu
func open_side_menu() -> void:
	Globals.scene_handler.open_side_menu()

# Returns a mystery resources full virtual path
func get_mystery_resource_path(relative_path : String) -> String:
	return current_json_location + "/" + relative_path

# Returns if a mystery resource exists
func mystery_resource_exists(relative_path : String) -> bool:
	return File.new().file_exists(current_json_location + "/" +  relative_path)

# Returns ImageTexture of a given local png path
func png_to_tex(local_res_path : String) -> ImageTexture:
	if local_res_path.empty():
		return null
	var i = Image.new()
	i.load(get_mystery_resource_path(local_res_path))
	var t = ImageTexture.new()
	t.create_from_image(i)
	return t

###############################################################################
# IMPORT DLC
###############################################################################


# Imports the mystery package located at the given path
# If path is not given all packages get imported that are
# located at user://DLC
# The dlc parameter determines if the packages is displayed
# in the dlc or the debug category
# If no arguments are given, all DLC in user://DLC get
# imported as DLC
func import(path = "all", dlc = false):
	var added_dirs = []
	var dir = Directory.new()
	var before = Funcs.list_folders_in_directory("res://")
	var removed = ""
	
	var froms = []
	
	if path == "all":
		for d in Funcs.list_files_in_directory("user://DLC"):
			import(OS.get_user_data_dir() + "/DLC/" + d, true)
		return
	else:
		# Copy before use
		var new_path = "user://temp/" + path.split("/")[path.split("/").size() - 1]
		
		# If already imported -> import with other new_name and change IMPORTED entry to newer one
		while dir.file_exists(new_path):
			removed = get_key_by_from(Globals.IMPORTED, new_path)
			Globals.IMPORTED = erase_from(Globals.IMPORTED, new_path)
			new_path = new_path.replace(".zip", "-re") + ".zip"
		
		dir.copy(path, new_path)
		froms.append(new_path)
		
		ProjectSettings.load_resource_pack(new_path)
	
	
	
	added_dirs = Funcs.get_added_items_in_arr1(Funcs.list_folders_in_directory("res://"), before)
	
	# If debug rirectory hasn't changed, add previously removed back to added_dirs list
	if removed != "":
		added_dirs.append(removed.replace("res://", ""))
	
	var counter = 0
	for d in added_dirs:
		var dRoot = "res://" + d
		var dJson = dRoot + "/" + Funcs.get_json_in_dir(dRoot)
		
		var data = Funcs.read_json(dJson)
		
		var dName = data.name
		var dType = data.type
		
		var dIType
		if dlc:
			dIType = "dlc"
		else:
			dIType = "debug"
		
		Globals.IMPORTED[dRoot] = {"name": dName, "type": dType, "import_type": dIType, "json": dJson, "from": froms[counter]}
		counter += 1

# Removes a dictionary's object from a dictionary
# Only works on the first layer (non-recursive)
func erase_from(dict : Dictionary, from : Dictionary) -> Dictionary:
	for key in dict.keys():
		if dict[key].from == from:
			dict.erase(key)
	return dict

# Returns the key of a object with in a dictionary that eqals the 'from' dictioanry
func get_key_by_from(dict : Dictionary, from : Dictionary) -> String:
	for key in dict.keys():
		if dict[key].from == from:
			return key
	return ""


# Returns a given string value in its type
func evaluate_value(input : String):
	var script = GDScript.new()
	script.set_source_code("func eval():\n\treturn " + input)
	script.reload()
	var obj = Reference.new()
	obj.set_script(script)
	printt("OBJ.EVAL()", obj.eval())
	return obj.eval()
