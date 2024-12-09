extends Control

@onready var main = $"../"


func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_settings_pressed() -> void:
	main.settingsMenu()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main scene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
