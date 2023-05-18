extends Control

@export var player : CharacterBody2D
@export var health_bar : ProgressBar

var player_alive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.max_value = player.max_health
	health_bar.value = player.health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_alive:
		health_bar.value = player.health
		$CanvasLayer/Score.text = "Score: " + str(player.counter)
	pass


func _on_player_death():
	player_alive = false
