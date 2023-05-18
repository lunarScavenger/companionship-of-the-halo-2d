extends CharacterBody2D

@export var speed = 350
@export var player : CharacterBody2D
@export var sprite : Sprite2D

@onready var _animation_player = $AnimationPlayer
var chasing = true


func _physics_process(delta):
	# follow player
	if chasing:
		position += (player.position - position) / speed
		
		# turn toward player
		if (player.position > position):
			sprite.flip_h = true
		else:
			sprite.flip_h = false


func _on_player_death():
	chasing = false # stop chasing when the player dies


func _on_hit_zone_body_entered(body):
	if body.is_in_group("player"):
		_animation_player.play("attack")
