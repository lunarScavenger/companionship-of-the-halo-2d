extends CharacterBody2D

@export var player := CharacterBody2D

var speed = 350

func _physics_process(delta):
	position += (player.position - position) / speed
