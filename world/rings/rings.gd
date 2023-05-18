extends Node2D

var ring_position = Vector2(randi_range(10, 2000), randi_range(10, 1100))
signal ring

func _ready():
	position = ring_position


#func _on_ring_body_entered(body):
	#if body.is_in_group("player"):
		#ring.emit()


func _on_player_ring():
	position = Vector2(randi_range(10, 2000), randi_range(10, 1100))
