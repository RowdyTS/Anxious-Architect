extends Area2D


@onready var architect = $Architect
@onready var speech = $Speech_Bubble

func _ready():
	# Correctly connect the "body_entered" signal to the "_on_stop_1_body_entered" method
	self.connect("body_entered", Callable(self, "_on_stop_1_body_entered"))

func _on_stop_1_body_entered(body):
	print("Body entered:", body)  # Debugging line to check what entered the area
	show_assets()

func show_assets():
	architect.visible = true
	speech.visible = true
	get_tree().paused = true
	await get_tree().create_timer(3.0).timeout  # Wait 2 seconds
	get_tree().paused = false  # Resume the game
