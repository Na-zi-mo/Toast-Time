extends Control


@onready var world = $"../../"

func _on_resume_pressed() -> void:
	SoundManager.play_click()
	world.pause_resume()


func _on_quit_pressed() -> void:
	SoundManager.play_click()
	get_tree().quit()


func _on_menu_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/menu.tscn")
