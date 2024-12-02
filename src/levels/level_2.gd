extends Node2D


@onready var pause_menu = $HUD/Pause
var paused = false

@onready var toast = $MagicToast

@onready var player = $Finn
	

func is_on_arcade() -> bool:
	return OS.get_executable_path().to_lower().contains("retropie")

func manage_end_game() -> void:
	if is_on_arcade() :
		if Input.is_action_pressed("hotkey") and Input.is_action_pressed("quit"):
			get_tree().quit()
	else :
		if Input.is_action_just_pressed("quit"):
			get_tree().quit()

func end_game():
	get_tree().change_scene_to_file("res://HUD/game_over.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	manage_end_game()
	if Input.is_action_just_pressed("pause"):
		pause_resume()

func pause_resume():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var hud = $HUD
	var player = $Finn
	PlayerData.apply(player)
	SoundManager.play_level2_music()
	player.connect('end_game', end_game)
	hud.update_health(player.health_component.health, player.health_component.max_health)

func _on_toast_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		toast.hide()
		get_tree().change_scene_to_file("res://HUD/game_won.tscn")
