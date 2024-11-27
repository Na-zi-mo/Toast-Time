extends Node
class_name Health

signal health_changed(current_health, max_health)
signal died


var max_health : float
var health : float

func _init(initial_health:float = 100.0):
	max_health = initial_health
	health = max_health


func take_damage(damage: float) -> void:
	health -= damage
	emit_signal("health_changed", health, max_health)
	if health <= 0:
		emit_signal("died")

func heal(amount: float) -> void:
	health = min(health + amount, max_health)
	emit_signal("health_changed", health, max_health)
