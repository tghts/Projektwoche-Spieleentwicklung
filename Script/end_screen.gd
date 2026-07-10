extends Node

@onready var zahnrad_count: Label = $Panel/ZahnradCount

func _ready() -> void:
	zahnrad_count.text = str(GameData.zahnrad_count)
	
	MusicManager.stop()
	
	var player = SoundManager.play("victory")
	
	if player:
		await player.finished
	MusicManager.play_playlist("title_music")
	get_tree().change_scene_to_file("res://Scene/credits.tscn")
