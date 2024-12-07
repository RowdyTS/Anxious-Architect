extends StaticBody2D


var ball_pos: Vector2
var target_y: float = 0.0  # Intermediate target position for smooth movement
var time_since_last_update: float = 0.0  # Tracks time elapsed for reaction delay
var reaction_delay: float = 0.1  # Delay in seconds before adjusting target
var window_height: int
var paddle_height: int

func _ready():
	window_height = get_viewport_rect().size.y
	paddle_height = $ColorRect.get_size().y
	target_y = position.y  # Start at current position

func _process(delta):
	global_position.y = lerp(global_position.y, target_y, 5 * delta)  # Smoothly interpolate toward target

	# Update the target position based on reaction delay
	time_since_last_update += delta
	if time_since_last_update >= reaction_delay:
		time_since_last_update = 0.0  # Reset the timer
		ball_pos = $"../Ball".position
		target_y = clamp(ball_pos.y, paddle_height / 2, window_height - paddle_height / 2)
