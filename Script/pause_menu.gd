extends Panel

func _ready() -> void:
	$VBoxContainer/Resume.grab_focus()

func _on_resume_pressed() -> void:
	SoundManager.play("pause")
	get_tree().paused = false
	self.hide()

func _on_settings_pressed() -> void:
	SoundManager.play("click")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scene/settings.tscn")
	
func _on_back_to_start_pressed() -> void:
	SoundManager.play("click")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
