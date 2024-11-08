extends Node
class_name Health

signal health_changed(current_health, max_health)
signal died


var max_health := 100
var health := 100

func take_damage(damage: int) -> void:
	health -= damage
	emit_signal("health_changed", health, max_health)
	if health <= 0:
		emit_signal("died")

func heal(amount: int) -> void:
	health = min(health + amount, max_health)
	emit_signal("health_changed", health, max_health)
