extends Node2D


@onready var pause_menu = $"Player/Pause-menu"
@onready var settings_menu = $"Player/settingsMenu"
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
		
