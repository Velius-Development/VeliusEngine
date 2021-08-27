extends Node

###############################################################################
#                                  VELIUS ENGINE                              #
###############################################################################

##############################
# SIGNALS:

signal new_dialogue(data)

##############################
# VARIABLES:

var next = null setget set_next
func set_next(new_next):
	next = new_next
	if next.type == "dialogue":
		run_dialogue(next)
	elif next.type == "location":
		run_location(next)

var json_data = {}
var current_chapter_id = null
var current_dialogue_id = null # current dialogue id
var current_location_id = null # current location id
var current_json_path = ""
var current_json_location = ""

##############################
# LOCAL DIALOGUE VARIABLES MANAGEMENT

var vars = {} # Stores local variables from the editor

func set_var(var_name, value):
	vars[current_json_path][current_chapter_id][var_name]["value"] = value

func get_var(var_name):
	if vars.has(current_json_path):
		if vars.has(current_chapter_id):
			if vars.has(var_name):
				if vars.has("value"):
					return vars[current_json_path][current_chapter_id][var_name]["value"]
			else:
				return null


###############################################################################
### FUNCTIONS                                                               ###
###############################################################################

func _ready():
	get_tree().set_auto_accept_quit(false)
	var dir = Directory.new()
	if !dir.dir_exists("user://DLC"):
		dir.make_dir("user://DLC")
	if !dir.dir_exists("user://temp"):
		dir.make_dir("user://temp")
	for item in Funcs.list_files_in_directory("user://temp"):
		dir.remove("user://temp/" + item)
	set_process(false)

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		var dir = Directory.new()
		for item in Funcs.list_files_in_directory("user://temp"):
			dir.remove("user://temp/" + item)
		get_tree().quit()

####################################
### PARSING JSON ###

func load_data(json_text):
	json_data = json_text
	#var file = File.new()
	#file.open(json_path, File.READ)
	#json_data = parse_json(file.get_as_text())
	#file.close()


func get_dialogue_by_id(id):
	for chapter in json_data:
		if chapter == current_chapter_id:
			for dialogue in json_data[chapter]["dialogues"]:
				if dialogue == id:
					return json_data[chapter]["dialogues"][dialogue]


func get_action(id):
	return json_data[current_chapter_id]["dialogues"][current_dialogue_id]["choices"][str(id)]["action"]

##########################################
### MESSAGE SYSTEM

# Start chapter
func start_chapter(json_path, chapterID):
	current_json_location = json_path
	Globals.scene_handler.open_dialogue_view(current_json_location + "/theme/Theme.tscn", Globals.scene_handler.TRANSITIONS.FADE_ZOOM)
	yield(get_tree().create_timer(0.1), "timeout")
	
	json_path = Funcs.read_json(Globals.IMPORTED[json_path].json)
	current_json_path = json_path
	
	current_chapter_id = chapterID
	load_data(json_path)

	set_process(true)
	current_dialogue_id = "0"
	set_next(get_dialogue_by_id("0"))

# Run dialogue
func run_dialogue(data):
	var final_text = data.text
	while final_text.find("@") != -1: # does it have at least one call for variable?
		var p = final_text.find("@")
		var s = final_text.find("@", p+1)
		var part = final_text.substr(p, s-p+1)
		var ev = final_text.substr(p+1, s-p-1)
		final_text = final_text.replace(part, str(evaluate_value(ev)))
	
	emit_signal("new_dialogue", data)
	

# Run location view
func run_location(l):
	pass


# warning-ignore:function_conflicts_variable
func next():			# Calls for the next step
	pass

# End the dialogue
func end():
	current_dialogue_id = null
	current_location_id = null
	current_chapter_id = null
	current_json_path = ""
	set_process(false)

###############################################################################
# API
###############################################################################


# When player dragged a choice card
func choice_made(id):
	VS.run(get_action(id))

func open_side_menu():
	Globals.scene_handler.open_side_menu()

func get_chapter_resource_path(string : String):
	return current_json_location + "/" + string

func mystery_resource_exists(string):
	return File.new().file_exists(current_json_location + "/" +  string)

func png_to_tex(local_res_path):
	var i = Image.new()
	i.load(get_chapter_resource_path(local_res_path))
	var t = ImageTexture.new()
	t.create_from_image(i)
	return t

###############################################################################
# IMPORT DLC
###############################################################################
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

func erase_from(dict : Dictionary, from) -> Dictionary:
	for key in dict.keys():
		if dict[key].from == from:
			dict.erase(key)
	return dict

func get_key_by_from(dict : Dictionary, from) -> String:
	for key in dict.keys():
		if dict[key].from == from:
			return key
	return ""

## GET A RANDOM NUMBER
#func random(possibilities):
#	randomize()
#	var r = randi() % possibilities + 1
#	return r
#
#
## GET TRUE OR FALSE DEPENDING ON CHANCE
#func chance(percent):
#	randomize()
#	var r = randi() % 100 + 1
#	print("chance: " + str(r))
#	if r <= percent:
#		return true
#	else:
#		return false


# GET A VALUE AND RETURN IT
func evaluate_value(input):
	var script = GDScript.new()
	script.set_source_code("func eval():\n\treturn " + input)
	script.reload()
	var obj = Reference.new()
	obj.set_script(script)
	printt("OBJ.EVAL()", obj.eval())
	return obj.eval()


# EXECUTE A FUNCTION
func execute_code(input):
	var script = GDScript.new()
	script.set_source_code("func eval():\n\treturn " + input)
	script.reload()
	var obj = Reference.new()
	obj.set_script(script)
	return obj.eval()
