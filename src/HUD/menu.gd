extends Control


func _ready() -> void:
	if not SoundManager.main_music.playing :
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


func _on_instructions_pressed() -> void:
	get_tree().change_scene_to_file("res://HUD/instructions_menu.tscn")
