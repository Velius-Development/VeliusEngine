extends Reference
class_name Funcs

static func list_files_in_directory(path) -> PoolStringArray:
	var files = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				files.append(file_name)
			file_name = dir.get_next()
	return files

static func list_folders_in_directory(path) -> PoolStringArray:
	var folders = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "" && file_name != "." && file_name != "..":
			if dir.current_is_dir():
				folders.append(file_name)
			file_name = dir.get_next()
	return folders

static func is_word_in_string(wordToSearch : String, string : String, caseSensitive = false):
	var spacedWords = string.split(" ", false)
	
	var words = []
	for word in spacedWords:
		for w in word.split("\n"):
			w = w.replace("\r", "")
			words.append(w)
	
	if caseSensitive:
		for word in words:
			if word == wordToSearch:
				return true
	else:
		for word in words:
			if word.to_lower() == wordToSearch.to_lower():
				return true
	return false


static func get_added_items_in_arr1(arr1, arr2) -> Array:
	var only_in_arr1 = []
	for v in arr1:
		if not (v in arr2):
			only_in_arr1.append(v)
	return only_in_arr1

	
	
static func get_json_in_dir(path : String) -> String:
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				if file_name.ends_with(".json"):
					return file_name
				else:
					file_name = dir.get_next()
			else:
				file_name = dir.get_next()
	return "not found"

static func read_json(path : String) -> Dictionary:
	var dict = {}
	var file = File.new()
	file.open(path, file.READ)
	var text = file.get_as_text()
	dict = JSON.parse(text).result
	file.close()
	return dict
