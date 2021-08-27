extends KeywordScript

func _init(data).(data):
	pass # DO NOT CHANGE

"""
DESCRIPTION

Runs the GD-Script-Code typed in its body.

"""


func run():
	var a = args
	var linesToRun = data["body"]
	# CREATE NEW INSTANCE OF VELIUS SCRIPT FOR RUNNING IT!!!!
	print("lines to run: " + str(linesToRun))

func checkArgs():
	pass

