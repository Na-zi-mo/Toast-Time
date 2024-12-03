extends Node2D


@onready var pause_menu = $HUD/Pause
var paused = false

@onready var player = $Finn

func _ready() -> void:
	SoundManager.play_level1_music()
	player.connect('end_game', end_game)

func end_game():
	get_tree().change_scene_to_file("res://HUD/game_over.tscn")

func is_on_arcade() -> bool:
	return OS.get_executable_path().to_lower().contains("retropie")

func manage_end_game() -> void:
	if is_on_arcade() :
		if Input.is_action_pressed("hotkey") and Input.is_action_pressed("quit"):
			get_tree().quit()
	else :
		if Input.is_action_just_pressed("quit"):
			get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	manage_end_game()
	if Input.is_action_just_pressed("pause"):
		pause_resume()
		

func pause_resume():
	if paused:
		get_tree().paused = false
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		$HUD/Pause/VBoxContainer/Resume.grab_focus()
		get_tree().paused = true
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
