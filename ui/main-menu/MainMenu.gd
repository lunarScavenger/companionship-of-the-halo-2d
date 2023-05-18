extends Control

var show_credits: bool = false

func _ready():
	print("loaded main menu")

func _on_start_button_up():
	get_tree().change_scene_to_file("res://world/flight-to-the-ford.tscn")


func _on_credits_pressed():
	if show_credits:
		$Text/Credits.hide()
		show_credits = false
		print("show")
	else:
		$Text/Credits.show()
		show_credits = true
		print("hide")
