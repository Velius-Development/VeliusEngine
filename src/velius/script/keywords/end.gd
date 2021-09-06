extends KeywordScript

func _init(data).(data):
	pass # DO NOT CHANGE

"""
DESCRIPTION

Ends the current mystery.

"""

var KEY = "end"
var RANGED = false

func run():
	Velius.end()

func checkArgs():
	pass
