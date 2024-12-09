extends Area2D

@onready var architect = $Architect
@onready var speech_bubble = $Speech_Bubble


func _ready():
	self.connect("body_entered", Callable(self, "_on_stop_3_body_entered"))

func _on_stop_3_body_entered(body):
	print("Body entered:", body)  
	show_assets()

func show_assets():
	architect.visible = true
	speech_bubble.visible = true
	get_tree().paused = true
	await get_tree().create_timer(3.0).timeout  
	get_tree().paused = false  
