extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("default")




# pause code

@onready var pause_menu = $"AnimatedSprite2D/Pause-menu"
@onready var settings_menu = $AnimatedSprite2D/settingsMenu
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
