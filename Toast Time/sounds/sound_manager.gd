extends Node

@onready var main_music = $MainMusic
@onready var monstadt_music = $MonstadtMusic
@onready var cave_music = $CaveMusic

func stop_musics():
	cave_music.stop()
	main_music.stop()
	monstadt_music.stop()

func play_menu_music():
	stop_musics()
	main_music.play()
	
func play_level1_music():
	stop_musics()
	monstadt_music.play()
	
func play_level2_music():
	stop_musics()
	cave_music.play()
