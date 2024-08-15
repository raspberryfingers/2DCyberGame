extends Node2D

# Signal to notify when the player is on the ladder
signal player_on_ladder(ladder_center_x)

func _ready():
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		emit_signal("player_on_ladder", position.x)


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		body.on_ladder = false
