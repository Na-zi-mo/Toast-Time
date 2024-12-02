extends Node2D


@onready var pause_menu = $HUD/Pause
var paused = false

@onready var player = $Finn

func _ready() -> void:
	SoundManager.play_level1_music()
	player.connect('end_game', end_game)

func end_game():
	get_tree().change_scene_to_file("res://HUD/game_over.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
