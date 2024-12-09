extends Node2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var pause_menu = $"Sprite2D/Pause-menu"
@onready var settings_menu = $"Sprite2D/settingsMenu"
var paused = false
var settingsOpen = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		pause_menu.show()
		
	
	paused = !paused

func settingsMenu():
	if settingsOpen:
		settings_menu.hide()
	else:
		settings_menu.show()
		
	settingsOpen = !settingsOpen








func _on_texture_button_pressed():
	# Start the Dialogic timeline
	audio_stream_player_2d.stop()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Introduction.dtl")
	

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("res://Assets/Ping.dtl")
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://Scenes/pong_prototype.tscn")
