extends Node2D


@onready var pause_menu = $HUD/Pause
var paused = false

@onready var player = $Finn
	

func end_game():
	print('dead')

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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var hud = $HUD
	var player = $Finn
	PlayerData.apply(player)
	SoundManager.play_level2_music()
	player.connect('end_game', end_game)
	hud.update_health(player.health_component.health, player.health_component.max_health)
	
