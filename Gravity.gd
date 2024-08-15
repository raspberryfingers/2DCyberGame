extends Node

@export var character_body_2d : CharacterBody2D 
@export var animated_sprite_2d : AnimatedSprite2D

@export var gravity : float = 1000 

func _physics_process(delta):
	if !character_body_2d.is_on_floor():
		character_body_2d.velocity.y += gravity * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
