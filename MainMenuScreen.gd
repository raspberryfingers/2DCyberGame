extends CanvasLayer


func _on_start_button_pressed():
	GameManager.open_start_menu() 


func _on_quit_button_pressed():
	GameManager.exit_game()
