extends CharacterBody2D

var speed = 250
@onready var progress_bar = $ProgressBar


var health = 100:
	set(value):
		health = value
		progress_bar.value = value
		if health == 0:
			get_tree().reload_current_scene()

func _physics_process(delta_):
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed
	move_and_slide()

func set_status(bullet_type):
	match bullet_type:
		0:
			damage()
		1:
			damage()
		2:
			damage()
		3:
			damage()

func damage():
	health -= 10
