class_name MarauderLeader
extends GenericCharacter

@export var GRAVITY = 10
@export var MAXFALLSPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player = $AnimationPlayer
	sprite = $Sprite2D
	anim_player.play("idle")
	health_component = HealthClass.new(200)
	direction = Vector2(scale.x, 0)

# Called every physics frame
func _physics_process(delta: float) -> void:
	
	if (velocity.x > 0):
		sprite.flip_h = false
	elif (velocity.x < 0):
		sprite.flip_h = true
	
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	velocity = motion
	move_and_slide()
