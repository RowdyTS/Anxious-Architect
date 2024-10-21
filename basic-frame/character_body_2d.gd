extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	get_input()

	move_and_slide()
