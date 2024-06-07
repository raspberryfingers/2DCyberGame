extends CharacterBody2D

enum PlayerState {
	IDLE,
	WALK,
	RUN,
	JUMP,
	FALL,
	CROUCH,
	CLIMB
}

var state = PlayerState.IDLE
var facing_right = true
var speed = 200
var jump_power = -600
var gravity = 2000
var climb_speed = 100
var is_climbing = false

func _process(delta):
	handle_input(delta)
	update_animation()

func handle_input(delta):
	var motion = Vector2()

	if Input.is_action_pressed("move_right"):
		motion.x += 1
		facing_right = true
	elif Input.is_action_pressed("move_left"):
		motion.x -= 1
		facing_right = false

	if Input.is_action_just_pressed("run"):
		state = PlayerState.RUN
	elif Input.is_action_just_released("run"):
		state = PlayerState.WALK

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		motion.y = jump_power
		state = PlayerState.JUMP

	if is_on_floor() and Input.is_action_just_pressed("crouch"):
		state = PlayerState.CROUCH
	elif Input.is_action_just_released("crouch"):
		state = PlayerState.IDLE

	if is_climbing:
		if Input.is_action_pressed("climb_up"):
			motion.y -= 1
		elif Input.is_action_pressed("climb_down"):
			motion.y += 1
		else:
			motion.y = 0

	motion = motion.normalized() * speed
	motion.y += gravity * delta  # Apply gravity based on delta time

	if is_climbing:
		motion.y = motion.y * climb_speed

	move_and_slide()

func update_animation():
	match state:
		PlayerState.IDLE:
			$AnimatedSprite.play("idle")
		PlayerState.WALK:
			$AnimatedSprite.play("walk")
		PlayerState.RUN:
			$AnimatedSprite.play("run")
		PlayerState.JUMP:
			$AnimatedSprite.play("jump")
		PlayerState.FALL:
			$AnimatedSprite.play("fall")
		PlayerState.CROUCH:
			$AnimatedSprite.play("crouch")
		PlayerState.CLIMB:
			$AnimatedSprite.play("climb")

	if not facing_right:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		is_climbing = true
		state = PlayerState.CLIMB # Replace with function body.


func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		is_climbing = false
		state = PlayerState.IDLE # Replace with function body.
