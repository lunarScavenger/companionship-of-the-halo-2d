extends CharacterBody2D

@export var player := CharacterBody2D

var speed = 350
var chasing = true

func _physics_process(delta):
	# follow player
	if chasing:
		position += (player.position - position) / speed


func _on_detection_zone_body_entered(body):
	pass

func enemy():
	pass # literally just to check off as an enemy


func _on_player_death():
	chasing = false # stop chasing when the player dies
