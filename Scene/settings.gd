extends Node
@onready var click_02: AudioStreamPlayer = $AudioStreamPlayer/Click02




func _on_back_pressed() -> void:
	click_02.play()
	await get_tree().create_timer(0.2).timeout #wait-methode für 0.2 sekunden
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
