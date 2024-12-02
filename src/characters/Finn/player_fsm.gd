extends GenericCharacter
class_name Player

@export var GRAVITY = 10
@export var MAXFALLSPEED = 200
@export var MAXSPEED = 200
@export var JUMPFORCE = 350

@onready var attack_zone = $AttackZone



#signal PlayerHit(value : int, max_value : int)
var life_timer : Timer = Timer.new()
var hp : int = 100
var max_hp : int = 100
var hp_increment : int = 2

signal end_game

@onready var dead_flag : bool = false

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
	health_component = HealthClass.new(100)
	health_component.connect('died', dead)

func dead():
	dead_flag = true


# Called every physics frame
func _physics_process(delta: float) -> void:
	
	if facing_right:
		sprite.flip_h = false
		attack_zone.position.x = 0
	else:
		sprite.flip_h = true
		attack_zone.position.x = -64
	
	if not dead_flag:
		velocity = motion
	
		motion.y += GRAVITY
	
		if motion.y > MAXFALLSPEED:
			motion.y = MAXFALLSPEED
		move_and_slide()
	

func apply_force(force : Vector2):
	motion += force

func has_been_hit(velocity: Vector2, damage: int):
	hit_velocity = velocity
	hit_flag = true
	take_damage(damage)
