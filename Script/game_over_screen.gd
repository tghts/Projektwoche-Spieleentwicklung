extends Node2D


func _ready() -> void:
	pass

func _on_start_again_pressed() -> void:
	get_tree().reload_current_scene()


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
