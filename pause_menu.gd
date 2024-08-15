extends Control

func _on_resume_pressed():
	GameManager.continue_game()
	queue_free() 

func _on_quit_pressed():
	get_tree().quit() 

func _on_restart_pressed():
	GameManager.start_game()
