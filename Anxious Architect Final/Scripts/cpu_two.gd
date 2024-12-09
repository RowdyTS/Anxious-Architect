extends StaticBody2D

var ball_pos : Vector2
var distance : int
var move_by : int
var window_height : int
var paddle_height : int
var delay_timer : float = 0.0
var delay_duration : float = 0.05  
var smoothing_factor : float = 0.1


func _ready():
	window_height = get_viewport_rect().size.y
	paddle_height = $ColorRect.get_size().y

func _process(delta):
	delay_timer -= delta
	if delay_timer <= 0.0:
		ball_pos = $"../Ball".position
		distance = position.y - ball_pos.y
		var base_speed = get_parent().paddle_speed * delta 
		move_by = lerp(0, distance, smoothing_factor)
		move_by = clamp(move_by, -base_speed, base_speed)
		position.y -= move_by
		position.y = clamp(position.y, 39, 317)
		delay_timer = 0.05
