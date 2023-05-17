extends CharacterBody2D

@export var player := CharacterBody2D

@onready var _animation_player = $AnimationPlayer
var speed = 350
var chasing = true

func enemy():
	pass # literally just to check off as an enemy

func _physics_process(delta):
	# follow player
	if chasing:
		position += (player.position - position) / speed
		
		# turn toward player
		if (player.position > position):
			get_node("Sprite2D").flip_h = true
		else:
			get_node("Sprite2D").flip_h = false


func _on_player_death():
	chasing = false # stop chasing when the player dies


func _on_hit_zone_body_entered(body):
	if body.has_method("player"):
		_animation_player.play("attack")
