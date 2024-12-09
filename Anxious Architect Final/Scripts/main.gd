extends Sprite2D

var score := [0, 0] # 0=Player and 1=CPU
const paddle_speed : int = 500
const winning_score : int = 7

# pause code
@onready var pause_menu = $"Pause-menu"
@onready var settings_menu = $settingsMenu
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
		


func _on_timer_timeout():
	$Ball.new_ball()


func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$CPUScore.text = str(score[1])
	$Timer.start()
	check_for_winner()

func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$PlayerScore.text = str(score[0])
	$Timer.start()
	check_for_winner()

func check_for_winner():
	if score[0] >= winning_score or score[1] >= winning_score:
		$Timer.stop()  # Stop the game timer
		Dialogic.timeline_ended.connect(_on_timeline_ended)  # Connect the signal to handle when the timeline ends
		Dialogic.start("res://Assets/Platformer.dtl")  # Start the dialog scene
		

# This function is called when the Dialogic timeline ends
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://Scenes/industrial_level.tscn")
