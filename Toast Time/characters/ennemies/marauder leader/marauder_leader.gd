class_name MarauderLeader
extends GenericCharacter

@export var GRAVITY = 10

var current_sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player = $AnimationPlayer
	current_sprite = $Sprite2D
	anim_player.play("idle")
	direction = Vector2(scale.x, 0)

# Called every physics frame
func _physics_process(delta: float) -> void:
	handle_gravity(delta)
	
	if (velocity.x > 0):
		current_sprite.flip_h = false
	elif (velocity.x < 0):
		current_sprite.flip_h = true
		
func handle_gravity(delta : float):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
