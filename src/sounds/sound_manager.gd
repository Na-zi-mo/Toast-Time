extends Node

@onready var main_music = $MainMusic
@onready var monstadt_music = $MonstadtMusic
@onready var cave_music = $CaveMusic
@onready var jake_punch = $JakePunch
@onready var jump = $Jump
@onready var click = $Click
@onready var game_over = $GameOver

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

func get_current_music():
	if main_music.playing:
		return main_music
	elif cave_music.playing:
		return cave_music
	elif monstadt_music.playing:
		return monstadt_music
	return null 
	

func play_jake_punch():
	jake_punch.play()

func play_game_over():
	game_over.play()
		
func play_jump():
	jump.play()
	
func play_click():
	click.play()
