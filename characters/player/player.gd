extends CharacterBody2D

@export var speed = 400.0

@onready var _animation_player = $AnimationPlayer
var direction = "Right" # default to facing right

# get input
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down") # direction
	velocity = input_direction * speed # velocity
	
	# animation
	if Input.is_action_pressed("right"): # moving right
		# direction
		if direction != "Right":
			get_node("Sprite2D").set_flip_h(false)
			direction = "Right"
		# animation
		_animation_player.play("walk")
	elif Input.is_action_pressed("left"): # moving left
		# direction
		if direction != "Left":
			get_node("Sprite2D").set_flip_h(true)
			direction = "Left"
		# animation
		_animation_player.play("walk")
	else:
		_animation_player.stop() # moving up/down / not moving

# 
func _physics_process(delta):
	get_input()
	move_and_slide()
