extends Node

# Runs a GDScript, returns what the run function returns
# If there is no run function, it gets created around the given code
func run(source_code):
	var script = GDScript.new()
	if not "func" in source_code:
		source_code = "func run():\n\t" + source_code.replace("\n", "\n	")
	script.set_source_code(source_code)
	script.reload()

	var obj = Reference.new()
	obj.set_script(script)
	return obj.run()
