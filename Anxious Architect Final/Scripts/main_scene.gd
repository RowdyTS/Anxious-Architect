extends Node2D



func _on_texture_button_pressed():
	# Start the Dialogic timeline
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Introduction.dtl")
	

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Ping.dtl")
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://Scenes/pong_prototype.tscn")
