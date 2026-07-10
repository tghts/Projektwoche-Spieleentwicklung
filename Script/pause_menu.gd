extends Panel

signal settings_requested

@onready var resume: Button = $VBoxContainer/Resume

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle()
		get_viewport().set_input_as_handled()

func toggle() -> void:
	SoundManager.play("pause")

	if visible:
		hide()
		get_tree().paused = false
	else:
		show()
		get_tree().paused = true
		resume.grab_focus()

func hide_for_settings() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_DISABLED

func show_after_settings() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	show()
	resume.grab_focus()

func _on_resume_pressed() -> void:
	toggle()

func _on_settings_pressed() -> void:
	SoundManager.play("click")
	settings_requested.emit()

func _on_back_to_start_pressed() -> void:
	SoundManager.play("click")
	GameData.reset_character_hp()
	get_tree().paused = false
	MusicManager.play_title_music()
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
