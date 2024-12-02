class_name GenericProgressBar
extends TextureProgressBar


@export var bar_name : String

func update_value (new_value : int, max : int):
	max_value = max
	value = new_value
