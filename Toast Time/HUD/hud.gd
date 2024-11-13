extends CanvasLayer

var player : Player
var health_bar : GenericProgressBar
var game_over 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("Finn") as Player
	health_bar = $HPProgressBar
	game_over = $GameOver
	player.health_component.connect("health_changed", update_health)
	
	update_health(player.health_component.health, player.health_component.max_health)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if player.flag_dead:
		#game_over.show()
		#Engine.time_scale = 0
	pass
	
func update_health(value : int, max_value : int):
	health_bar.update_value(value, max_value)
