extends Node

func run(source_code):
	var script = GDScript.new()
	if not "func" in source_code:
		source_code = "func run():\n\t" + source_code.replace("\n", "\n	")
	script.set_source_code(source_code)
	script.reload()

	var obj = Reference.new()
	obj.set_script(script)
	return obj.run()
