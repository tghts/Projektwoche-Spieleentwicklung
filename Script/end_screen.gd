extends Node

func _ready() -> void:
	SoundManager.play("victory")
	await get_tree().create_timer(13).timeout
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
