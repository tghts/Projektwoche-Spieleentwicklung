extends Node


func _on_level_1_pressed() -> void:
	SoundManager.play("click")
	get_tree().change_scene_to_file("res://Scene/level_1.scn")

func _on_level_2_pressed() -> void:
	SoundManager.play("click")
	get_tree().change_scene_to_file("res://Scene/level_2.scn")

func _on_level_3_pressed() -> void:
	SoundManager.play("click")
	get_tree().change_scene_to_file("res://Scene/level_3.scn")

func _on_level_4_pressed() -> void:
	SoundManager.play("click")
	get_tree().change_scene_to_file("res://Scene/level_4.scn")
