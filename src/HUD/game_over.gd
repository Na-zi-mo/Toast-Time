extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.stop_musics()
	SoundManager.play_game_over()


func _on_restart_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_menu_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/menu.tscn")

func _on_quit_pressed() -> void:
	SoundManager.play_click()
	get_tree().quit()
