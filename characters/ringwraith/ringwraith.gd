extends CharacterBody2D

@export var speed = randi_range(100, 350)
@export var player : CharacterBody2D
@export var sprite : Sprite2D

@onready var _animation_player = $AnimationPlayer
var chasing = true


func _physics_process(delta):
	# follow player
	if chasing:
		self.position += (player.position - self.position) / speed
		
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


func _on_speed_timer_timeout():
	if speed >= 41:
		speed -= 20
		print("Speed up: " + str(speed))
		get_node("SpeedTimer").start()
		if speed >= 225:
			speed -= 50
