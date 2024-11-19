extends Area2D

@onready var timer: Timer = $Timer
@onready var death_sound: AudioStreamPlayer2D = $death_sound


func _on_body_entered(_body):
	print("you died")
	death_sound.play()
	timer.start()




func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
