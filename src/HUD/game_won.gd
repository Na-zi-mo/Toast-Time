extends Control


func _ready() -> void:
	$VBoxContainer/Menu.grab_focus()

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

func _on_menu_pressed() -> void:
	SoundManager.stop_musics()
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/menu.tscn")
