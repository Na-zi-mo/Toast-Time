extends GenericCharacter
class_name Player

@export var GRAVITY = 10
@export var MAXFALLSPEED = 200
@export var MAXSPEED = 200
@export var JUMPFORCE = 350

const ACCEL = 75.0
var accel = ACCEL
var facing_right : bool = true
var hit_flag : bool = false
var hit_velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player = $AnimationPlayer
	sprite = $Sprite2D
	anim_player.play("idle")

func apply_force(force : Vector2):
	motion += force

# Called every physics frame
func _physics_process(delta: float) -> void:
	sprite.flip_h = !facing_right
	
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	velocity = motion
	move_and_slide()

func has_been_hit(velocity: Vector2):
	hit_velocity = velocity
	hit_flag = true
