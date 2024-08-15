extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_continue_game_pressed():
	pass # Replace with function body.


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://cyber_lv_1.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://StartMenu/control.tscn")
