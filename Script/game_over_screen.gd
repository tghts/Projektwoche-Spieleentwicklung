extends Node2D

@onready var start_again: Button = $Panel/VBoxContainer/StartAgain
@onready var zahnrad_count: Label = $Panel/ZahnradCount

func _ready() -> void:
	zahnrad_count.text = str(GameData.zahnrad_count)
	start_again.grab_focus()
	MusicManager.stop()

func _on_start_again_pressed() -> void:
	SoundManager.play("click")
	GameData.reset_character_hp()
	GameData.reset_zahnrad()
	get_tree().change_scene_to_file("res://Scene/level_1.scn")

func _on_back_to_menu_pressed() -> void:
	SoundManager.play("click")
	MusicManager.play_playlist("title_screen")
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
