extends Control

var key

func init_data(data):
	$MarginContainer/HBoxContainer2/HBoxContainer/MarginContainer/VBoxContainer/Label.text = data.title
	$MarginContainer/HBoxContainer2/HBoxContainer/MarginContainer/VBoxContainer/Label.get("custom_fonts/font").size = 150 - data.title.length() * 3
	$MarginContainer/HBoxContainer2/HBoxContainer/MarginContainer/VBoxContainer/MarginContainer/Label2.text = data.author.to_upper() + "\nVERSION\nLAST PLAYED"
	key = data.key

func _ready():
	pass

func _on_SlickButton_pressed():
	Velius.start_chapter(key, 0)
