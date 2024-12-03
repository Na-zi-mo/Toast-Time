extends Control

func is_on_arcade() -> bool:
	return OS.get_executable_path().to_lower().contains("retropie")

func manage_end_game() -> void:
	if is_on_arcade() :
		if Input.is_action_pressed("hotkey") and Input.is_action_pressed("quit"):
			get_tree().quit()
	else :
		if Input.is_action_just_pressed("quit"):
			get_tree().quit()

func _process(delta: float) -> void:
	manage_end_game()

func _ready() -> void:
	$VBoxContainer/Start.grab_focus()
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
