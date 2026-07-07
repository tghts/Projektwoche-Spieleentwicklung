extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	audio_stream_player.play()
	await get_tree().create_timer(13).timeout
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
