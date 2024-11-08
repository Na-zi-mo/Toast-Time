extends CharacterBody2D
class_name GenericCharacter

@onready var HealthClass = preload("res://characters/health.gd")
var health_component : Health

var anim_player : AnimationPlayer
var sprite : Sprite2D
var direction : Vector2
var motion : Vector2

func get_animation_player () -> AnimationPlayer:
	return anim_player

func take_damage(damage):
	health_component.take_damage(damage)

func heal(amount):
	health_component.heal(amount)
