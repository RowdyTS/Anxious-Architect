extends CharacterBody2D

var window_size : Vector2
const start_speed : int = 250
const acceleration : int = 50
var speed : int
var direction : Vector2
const max_y_vector : float = 0.6

#Called when the node enters the scene for the first time
func _ready():
	window_size = get_viewport_rect().size
	
func new_ball():
	# Randomize the starting position and direction of the ball
	position = Vector2(window_size.x / 2, randi_range(200, window_size.y - 200))  
	speed = start_speed
	direction = random_direction() 

# Called every frame, delta is the elapsed time since the previous frame
func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		#If ball hits a paddle
		if collider == $"../Player" or collider == $"../CPU":
			speed = speed + acceleration
			direction = new_direction(collider)
		#If ball hits a wall
		else: 
			direction = direction.bounce(collision.get_normal())
		

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()
	
func new_direction(collider):
	var ball_y = position.y
	var paddle_y = collider.position.y
	var distance = ball_y - paddle_y
	var new_dir := Vector2()
	
	#Flip horizontal direction
	if direction.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (distance / (collider.paddle_height / 2)) * max_y_vector
	return new_dir.normalized()
	
