extends Control


func _ready() -> void:
	$VBoxContainer/Back.grab_focus()
	if is_on_arcade():
		$VBoxContainer/RichTextLabel.text = "[center][color=white] Move Left/Right : JoyStick \nJump : X \nRun : Hold B \nAttack: A\n Mute/Unmute: Y[/color][/center]"
	else:
		$VBoxContainer/RichTextLabel.text = "[center][color=white] Move Left : A\nMove Right : D\nJump: Spacebar \nAttack: J\nRun: Hold Shift\nMute/Unmute: M  [/color][/center]"



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

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://HUD/menu.tscn")
