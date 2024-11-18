extends Area2D


const LEVEL_FILE_PATH = "res://levels/level_"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		var current_scene_file = get_parent().scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = LEVEL_FILE_PATH + str(next_level_number) + ".tscn"
		print(next_level_path)
		#get_tree().change_scene_to_file(next_level_path)
