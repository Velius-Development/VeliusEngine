extends KeywordScript

func _init(data).(data):
	pass # DO NOT CHANGE

"""
DESCRIPTION

Switches to the next dialogue.

"""

var KEY = "->"
var RANGED = false

func run():
	Velius.current_dialogue_id = self.args[0]
	Velius.set_next(Velius.get_dialogue_by_id(self.args[0]))
	if !Velius.get_var("DISABLE_CLEAR_HAND"):
		Globals.cardHolder.reset()

func checkArgs():
	if self.args.size() != 1:
		VS.error("Needs exact one argument")
		return
	if !self.args[0].is_valid_integer():
		VS.error("The fist argument must be a number")
		return
	if Velius.get_dialogue_by_id(self.args[0]) == null:
		VS.error("Dialogue not found")
		return
