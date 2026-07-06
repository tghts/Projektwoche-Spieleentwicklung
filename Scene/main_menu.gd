extends Node



func _on_startknopf_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")



func _on_exitknopf_pressed() -> void:
	get_tree().quit()


func _on_settingknopf_pressed() -> void:
	pass # Replace with function body.
