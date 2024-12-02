class_name Skeleton
extends GenericCharacter


@export var GRAVITY = 10
@export var MAXFALLSPEED = 200

@export var is_alive = false

@onready var health_bar = $TextureProgressBar

var detection_distance = 250

func _ready() -> void:

	anim_player = $AnimationPlayer
	sprite = $Sprite2D
	health_component = HealthClass.new(75)
	
	health_component.connect("health_changed", update_health)
	
	update_health(health_component.health, health_component.max_health)
	
	direction = Vector2(scale.x, 0)

func update_health(value : int, max_value : int):
	if is_alive:
		health_bar.update_value(value, max_value)

func apply_force(force : Vector2):
	motion += force

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
	
	health_bar.visible = is_alive 
	
	move_and_slide()
		
