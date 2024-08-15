extends Node

func _on_continue_game_pressed():
	pass # Replace with function body.


func _on_new_game_pressed():
	GameManager.start_game()
	queue_free()


func _on_back_pressed():
	pass # Replace with function body.
