extends Node

signal character_hp_changed(hp: int)
signal zahnrad_count_changed(count: int)

var music_volume := 1.0
var sound_effects_volume := 1.0
var character_hp := 5
var zahnrad_count := 0

func reduce_character_hp():
	if character_hp <= 1:
		kill_character()
	else:
		character_hp -= 1
		character_hp_changed.emit(character_hp)

func reset_character_hp():
	character_hp = 5
	character_hp_changed.emit(character_hp)
	
func kill_character():
	SoundManager.play("game_over")
	reset_character_hp()
	get_tree().change_scene_to_file.call_deferred("res://Scene/game_over_screen.tscn")

func add_zahnrad():
	zahnrad_count += 1
	zahnrad_count_changed.emit(zahnrad_count)

func reset_zahnrad():
	zahnrad_count = 0
	zahnrad_count_changed.emit(zahnrad_count)
