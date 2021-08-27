extends Node
class_name KeywordScript

signal finished

var data = {}
var args = []

func _init(data : Dictionary):
	self.data = data
	for arg in data["args"]:
		if arg != "":
			if VS.commentSign in arg:
				break
			args.append(arg)
	_checkArgs()
	_run()
	_finished()

func _checkArgs():
	if has_method("checkArgs"):
		call("checkArgs")

func _run():
	if has_method("run"):
		call("run")

func _finished():
	emit_signal("finished")
	queue_free()
