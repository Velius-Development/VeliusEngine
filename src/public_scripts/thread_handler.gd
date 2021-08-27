extends Node

onready var thread = Thread.new()

var jobs = []

func add_job(object : Object, function : String, jobArgs : PoolStringArray, callBack := "", callBackObject=null, delay := 0):
	yield(get_tree().create_timer(delay), "timeout")
	var job = {}
	job["object"] = object
	job["function"] = function
	job["args"] = jobArgs
	if !callBack.empty():
		job["callBack"] = callBack
	if callBackObject:
		job["callBackObject"] = callBackObject
	else:
		job["callBackObject"] = object
	jobs.append(job)

func _ready():
	thread.start(self, "_thread_loop")

func _thread_loop(ignore):
	yield(get_tree().create_timer(0.00001), "timeout")
	while jobs.size() < 1:
		_thread_loop(null)
		return
	var job = jobs.pop_front()
	
	match job.args.size():
		0:
			job.object.call(job.function)
		1:
			job.object.call(job.function, job.args[0])
		2:
			job.object.call(job.function, job.args[0], job.args[1])
		3:
			job.object.call(job.function, job.args[0], job.args[1], job.args[2])
		4:
			job.object.call(job.function, job.args[0], job.args[1], job.args[2], job.args[3])
	if job.has("callBack"):
		if job.has("callBackObject"):
			job.callBackObject.call_deferred(job.callBack)
		else:
			job.object.call_deferred(job.callBack)
	if thread.is_active():
		thread.wait_to_finish()
	_thread_loop(null)
