extends CharacterBody2D

signal death

@export var speed = 400.0
@export var max_health: float = 100.0
@export var sprite : Sprite2D

@onready var _animation_player = $AnimationPlayer
var direction = "Right" # default to facing right
var health: float = 100.0
var alive = true
var counter: int = 0


# get input
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down") # direction
	velocity = input_direction * speed # velocity
	
	# animation
	if Input.is_action_pressed("right"): # moving right
		# direction
		if direction != "Right":
			sprite.set_flip_h(false)
			direction = "Right"
		# animation
		_animation_player.play("walk")
	elif Input.is_action_pressed("left"): # moving left
		# direction
		if direction != "Left":
			sprite.set_flip_h(true)
			direction = "Left"
		# animation
		_animation_player.play("walk")
	else:
		_animation_player.stop() # moving up/down / not moving


func _physics_process(delta):
	get_input()
	move_and_slide()
	
	# player death
	if health <= 0:
		death.emit()
		alive = false
		health = 0
		print("player died")
		self.queue_free()


func update_health(delta):
	health += delta


func _on_hitbox_body_entered(body):
	if body.is_in_group("enemy"):
		update_health(-25)
		print("player health: " + str(health))


func _on_timer_timeout():
	counter += 1
