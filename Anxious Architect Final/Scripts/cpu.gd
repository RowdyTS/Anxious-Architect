extends StaticBody2D

var ball_pos : Vector2
var distance : int
var move_by : int
var window_height : int
var paddle_height : int
# Called when the node enters the scene tree for the first time.
func _ready():
	window_height = get_viewport_rect().size.y
	paddle_height = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Move paddle towards the ball
	ball_pos = $"../Ball".position
	distance = position.y - ball_pos.y
	if abs(distance) > get_parent().paddle_speed * delta:
		move_by = get_parent().paddle_speed * delta * (distance / abs(distance))
	else:
		move_by = distance
	
	position.y -= move_by
	position.y = clamp(position.y, 39, 317)
	
