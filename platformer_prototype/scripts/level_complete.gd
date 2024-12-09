extends Area2D

@onready var level_win: AudioStreamPlayer2D = $Level_Win


func _on_body_entered(body: Node2D):
	print("You completed the level!")
	level_win.play()
	get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
	



	
