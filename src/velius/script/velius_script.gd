extends Node

const ERR_PREFIX = "Velius-Script-Error:\n"

const pathPrefix = "res://src/velius/script/keywords/"

const keys = {
	
			"->": "GO_NEXT.gd",
			"END": "END.gd",

			}

const rangeKeys = {
			
			"RUN": "RUN.gd",
			"FUNC": "FUNC.gd"
			
				}

const commentSign = "#"

var lines = []
var tab_levels = []

var lineCounter : int

var current_key

func run(script : String):
	readLines(script)
	processLines()

func readLines(script : String):
	lines = []
	tab_levels = []
	for line in script.split("\n"):											# Load lines into lines[]
		lines.append(line)
		tab_levels.append(line.count("    "))

func processLines():
	lineCounter = 0
	var skipLinesUpTo = 0
	for line in lines:
		lineCounter += 1
		
		for key in rangeKeys:
			current_key = key
			
			if Funcs.is_word_in_string(key, line):
				if !line.replace(" ", "").begins_with(key):
					error("A range-key can only be used at the biginning of a line.")
				else:
					
					var min_tab_level = tab_levels[lineCounter]
					
					# Get body
					var comingLines = []
					var bodyLines = []
					comingLines += lines										# Set this equal create a pointer :(
					
					for i in range(lineCounter):								# Only get the lines that weren't already processed
						comingLines.pop_front()
					########################
					
					var lCounter = 0
					for l in comingLines:
						lCounter += 1
						if tab_levels[lCounter + lineCounter - 1] < min_tab_level:											# Close body
							break
						else:
							bodyLines.append(l)									# Add line to body
					
					# Hand over body lines to keyword script and run
					var keywordScriptInstance = load(pathPrefix + rangeKeys[key]).new({"args": line.replace(key, "").split(" ").erase(line.replace(key, "").split(" ").length() - 1, 1), "body": bodyLines})
					#yield(keywordScriptInstance, "finished")		BREAKS THE FOR LOOP
					
					#skip normal commands until lCounter line
					skipLinesUpTo = lCounter + lineCounter - 2
					print(skipLinesUpTo)

		if lineCounter > skipLinesUpTo:
			for key in keys:
				current_key = key
				if Funcs.is_word_in_string(key, line):
					if line.replace(" ", "").begins_with(key):
						var keywordScriptInstance = load(pathPrefix + keys[key]).new({"args": line.replace(key, "").split(" ")})
						#yield(keywordScriptInstance, "finished")		BREAKS THE FOR LOOP
					else:
						error("A one-line key can only be used at the biginning of a line.")

func error(message : String):
	print("\n" + ERR_PREFIX  + "'" + current_key + "' - " + message + "\nError at dialogue: " + str(Velius.current_dialogue_id) + "\n             line: " + str(lineCounter))
