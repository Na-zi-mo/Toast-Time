extends CanvasLayer
class_name HUD

const LEVEL_FILE_PATH = "res://levels/level_"

@onready var player : Player
@onready var health_bar : GenericProgressBar

@onready var debug_label = $DebugLabel

@onready var debug_flag : bool = false

var memory : float
var video_memory : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("Finn") as Player
	health_bar = $HPProgressBar
	player.health_component.connect("health_changed", update_health)
	
	update_health(player.health_component.health, player.health_component.max_health)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if debug_flag:
		memory = Performance.get_monitor(Performance.MEMORY_STATIC) / 1048576
		video_memory = Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED) / 1048576  
		var formated_memory = "%.2f" % memory
		var formated_video_memory = "%.2f" % video_memory
		var player_x_position  = "%.1f" % player.global_position.x
		var player_y_position  = "%.1f" % player.global_position.y
		debug_label.text = "memory : " + str(formated_memory) + " MB/s" + "\nvideo memory : " + str(formated_video_memory) + "MB/s" + "\nfps : " + str(Performance.get_monitor(Performance.TIME_FPS)) + " fps" + "\nplayer position : (" + str(player_x_position) + ", " + str(player_y_position) + ")\n player health : " + str(player.health_component.health) + "/" + str(player.health_component.max_health) 

	
func update_health(value : int, max_value : int):
	health_bar.update_value(value, max_value)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug"):
		debug_flag = !debug_flag
		debug_label.visible = debug_flag
		
	if Input.is_action_just_pressed('suicide'):
		player.take_damage(100)
		
	if Input.is_action_just_pressed('cheat'):
		var current_scene_file = get_parent().scene_file_path
		if current_scene_file.to_int() == 1:
			var next_level_number = current_scene_file.to_int() + 1
			var next_level_path = LEVEL_FILE_PATH + str(next_level_number) + ".tscn"
			PlayerData.save(player)
			get_tree().change_scene_to_file(next_level_path)
		player.position = Vector2(2186,394)
