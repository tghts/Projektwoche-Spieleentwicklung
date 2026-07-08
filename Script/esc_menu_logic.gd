extends Control
@onready var click: AudioStreamPlayer = $AudioStreamPlayer/Click
@onready var label: Panel = $Label
@onready var pause: AudioStreamPlayer = $AudioStreamPlayer/Pause


func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("esc")
	if esc_pressed:
		pause.play()
		get_tree().paused = false
		label.show()

func _on_resume_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.16).timeout
	
	get_tree().paused = false
	pass # Replace with unpause function.

func _on_options_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.16).timeout
	pass # Replace with Options menü.
	
func _on_quit_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")
