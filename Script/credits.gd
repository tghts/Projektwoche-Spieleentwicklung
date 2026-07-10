extends Node

@onready var credits: Panel = $Credits
@onready var h_box_container: HBoxContainer = $Credits/HBoxContainer
@onready var thanksfor_playing: Label = $Credits/ThanksforPlaying
#var last_scene: PackedScene

func _ready() -> void:
	move_text()

func move_text():
	while (thanksfor_playing.position.y != 248.0):
		await get_tree().create_timer(0.01).timeout
		h_box_container.position.y -= 0.5
		thanksfor_playing.position.y -= 0.5
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
