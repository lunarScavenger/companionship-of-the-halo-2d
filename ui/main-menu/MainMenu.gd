extends Control

func _ready():
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (true) else Window.MODE_WINDOWED

func _on_start_button_up():
	print("Hello")
