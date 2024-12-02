extends Control

@onready var music_slider : HSlider = $VBoxContainer/MusicSlider
@onready var master_slider : HSlider = $VBoxContainer/MasterSlider
@onready var sfx_slider : HSlider = $VBoxContainer/SfxSlider

func _ready() -> void:
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	master_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://HUD/options.tscn")


func _on_music_slider_drag_ended(value_changed: bool) -> void:
	var value = music_slider.value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))


func _on_master_slider_drag_ended(value_changed: bool) -> void:
	var value = master_slider.value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	var value = sfx_slider.value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))
