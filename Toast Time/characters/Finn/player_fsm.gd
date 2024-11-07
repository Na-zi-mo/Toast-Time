extends GenericCharacter
class_name Player

@export var GRAVITY = 10
@export var MAXFALLSPEED = 200
@export var MAXSPEED = 200
@export var JUMPFORCE = 350

signal PlayerHit(value : int, max_value : int)
var life_timer : Timer = Timer.new()
var hp : int = 100
var max_hp : int = 100
var hp_increment : int = 2


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
	
	
	
	
	add_child(life_timer)
	life_timer.wait_time = 1.0
	life_timer.autostart = true
	life_timer.timeout.connect(_on_life_timer_timeout)
	life_timer.start()
func _on_life_timer_timeout() -> void :
	
	if (hp <= 0 || hp >= max_hp):
		hp_increment = -hp_increment
	
	hp += hp_increment
			
	PlayerHit.emit(hp, max_hp)

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
