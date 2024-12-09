extends Area2D

@onready var timer: Timer = $Timer
@onready var death_sound: AudioStreamPlayer2D = $Death_Sound

func _on_body_entered(body: Node2D):
	print("You died!")
	death_sound.play()
	timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene()
