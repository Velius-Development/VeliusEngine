extends Node

signal loaded
signal process

var http_request
var process_percent = 0

func download(url:String):
	var splitted = url.split("/")
	var file_name = splitted[splitted.size() - 1]
	
	http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.use_threads = true
	http_request.connect("request_completed", self, "_send_loaded_signal")
	
	
	# If file to download already exists -> add "_" + rnd number to filename
	
	var fname = "user://DLC/" + file_name
	
	var dir = Directory.new()
	while dir.file_exists(fname):
		fname = fname.split(".")[0] + "_" + str(rand_range(0, 100)) + fname.split(".")[1]
	
	# Set download destination and start download
	http_request.download_file = fname
	http_request.request(url)

func _process(delta):
	var current_precent = get_process()*100 / http_request.get_body_size()
	if process_percent != current_precent:
		process_percent = current_precent
		emit_signal("process", current_precent)

func get_process():
	return http_request.get_downloaded_bytes()
 
func _send_loaded_signal(r, code, headers, body):
	emit_signal("loaded", r, code, headers, body)
	pass
