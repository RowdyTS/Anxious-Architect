extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D):
	print("You win!!!")
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Bullet Hell.dtl")



func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://Scenes/bossroom.tscn")
	
	
