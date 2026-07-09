extends Node2D

@onready var start_again: Button = $Panel/VBoxContainer/StartAgain

func _ready() -> void:
	start_again.grab_focus()

func _on_start_again_pressed() -> void:
	SoundManager.play("click")
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")

func _on_back_to_menu_pressed() -> void:
	SoundManager.play("click")
	MusicManager.play_title_music()
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
