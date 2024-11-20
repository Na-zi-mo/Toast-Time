extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var hud = $HUD
	var player = $Finn
	PlayerData.apply(player)
	
	hud.update_health(player.health_component.health, player.health_component.max_health)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
