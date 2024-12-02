extends Control


func _ready() -> void:
	SoundManager.play_menu_music()


func _on_start_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
	
func _on_options_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/options.tscn")

func _on_quit_pressed() -> void:
	SoundManager.play_click()
	get_tree().quit()
