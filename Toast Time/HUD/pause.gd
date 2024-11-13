extends Control


@onready var world = $"../../"

func _on_resume_pressed() -> void:
	world.pause_resume()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://HUD/menu.tscn")
