extends Node
@onready var click_02: AudioStreamPlayer = $AudioStreamPlayer/Click02

func _on_startknopf_pressed() -> void:
	click_02.play()
	await get_tree().create_timer(0.2).timeout #wait-methode für 0.2 sekunden
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")

func _on_exitknopf_pressed() -> void:
	get_tree().quit()


func _on_settingknopf_pressed() -> void:
	click_02.play()
	await get_tree().create_timer(0.2).timeout #wait-methode für 0.2 sekunden
	get_tree().change_scene_to_file("res://Scene/settings.tscn") # Replace with function body.
