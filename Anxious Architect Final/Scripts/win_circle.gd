extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"


func _ready():
	audio_stream_player_2d.play()
	self.connect("body_entered", Callable(self, "_on_body_entered"))
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_body_entered(body):
	audio_stream_player_2d.stop()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Reach Out.dtl")



func _on_timeline_ended():
	print("finish")
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://Scenes/pong_prototype_two.tscn")
	
	
	
