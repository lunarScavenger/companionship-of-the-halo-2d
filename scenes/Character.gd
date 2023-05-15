extends CharacterBody2D


@export var speed = 400.0
const JUMP_VELOCITY = -700.0
signal text
var apple = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func attack():
	if Input.is_action_just_released("attack"):
		get_node("AttackTemp").show()
		get_node("AttackTemp/TempTimer").start()

func _physics_process(delta):
	attack()
	get_input()
	move_and_slide()


func _on_area_2d_body_entered(body):
	if apple == true:
		text.emit()


func _on_timer_timeout():
	apple = true


func _on_temp_timer_timeout():
	get_node("AttackTemp").hide()
