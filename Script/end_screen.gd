extends Node

func _ready() -> void:
	MusicManager.stop()
	var player = SoundManager.play("victory")
	
	if player:
		await player.finished
	MusicManager.play_title_music()
	get_tree().change_scene_to_file("res://Scene/credits.tscn")
