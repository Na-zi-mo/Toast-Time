class_name Skeleton
extends GenericCharacter


@export var GRAVITY = 10
@export var MAXFALLSPEED = 200

@onready var health_bar = $TextureProgressBar

func _ready() -> void:

	anim_player = $AnimationPlayer
	sprite = $Sprite2D
	health_component = HealthClass.new(75)
	
	health_component.connect("health_changed", update_health)
	
	update_health(health_component.health, health_component.max_health)
	
	direction = Vector2(scale.x, 0)

func update_health(value : int, max_value : int):
	health_bar.update_value(value, max_value)

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
	
	#print(velocity)
	move_and_slide()
		
