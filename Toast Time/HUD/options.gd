extends Control



func _on_go_back_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/menu.tscn")


func _on_sound_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/sound_options.tscn")
