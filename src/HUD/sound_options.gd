extends Control

@onready var slider : HSlider = $VBoxContainer/HSlider

func _ready() -> void:
	slider.value = db_to_linear(SoundManager.get_current_music().volume_db)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/options.tscn")


func _on_h_slider_drag_ended(value_changed: bool) -> void:
	var value = slider.value
	SoundManager.get_current_music().volume_db = linear_to_db(value)
