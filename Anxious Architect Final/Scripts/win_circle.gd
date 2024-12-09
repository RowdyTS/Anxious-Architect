extends Area2D


func _ready():
	
	self.connect("body_entered", Callable(self, "_on_body_entered"))
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_body_entered(body):
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Reach Out.dtl")



func _on_timeline_ended():
	print("finish")
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://Scenes/pong_prototype_two.tscn")
	
	
	
