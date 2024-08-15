extends CanvasLayer


func _on_resume_pressed():
	GameManager.continue_game()
	queue_free()


func _on_restart_pressed():
	GameManager.restart_game()
	queue_free()


func _on_quit_pressed():
	GameManager.exit_game()


func _on_main_menu_pressed():
	GameManager.main_menu()
