extends Node

@onready var credits: Panel = $Credits
@onready var h_box_container: HBoxContainer = $Credits/HBoxContainer
@onready var thanks_for_playing: Label = $Credits/ThanksforPlaying

func _ready() -> void:
	MusicManager.play_playlist("credits")
	move_text()

func move_text():
	while (thanks_for_playing.position.y != 248.0):
		await get_tree().create_timer(0.01).timeout
		h_box_container.position.y -= 0.5
		thanks_for_playing.position.y -= 0.5
	await get_tree().create_timer(5).timeout
	MusicManager.play_playlist("title_screen")
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
