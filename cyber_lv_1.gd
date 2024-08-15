extends Node2D

@onready var pause_menu = preload("res://StartMenu/pause_menu.tscn")
var paused = false 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://StartMenu/pause_menu_screen.tscn")

