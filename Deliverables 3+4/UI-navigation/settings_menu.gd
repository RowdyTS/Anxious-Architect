extends Control

@onready var main = $"../"

func _on_back_pressed() -> void:
	main.settingsMenu()
