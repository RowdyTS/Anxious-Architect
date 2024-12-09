extends Area2D


func _ready():
	# Correctly connect the "body_entered" signal to the "_on_stop_1_body_entered" method
	self.connect("body_entered", Callable(self, "_on_stop_1_body_entered"))

func _on_stop_1_body_entered(body):
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Reach Out.dtl")



func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
