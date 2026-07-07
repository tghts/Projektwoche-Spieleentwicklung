extends Node
@onready var click_02: AudioStreamPlayer = $AudioStreamPlayer/Click02

func _on_back_pressed() -> void:
	click_02.play()
	await get_tree().create_timer(0.2).timeout # wait-methode für 0.2 sekunden
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		fullscreen()
	else:
		windowed()

func fullscreen() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func windowed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_music_drag_ended(value_changed: bool) -> void:
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value_changed))

func _on_sound_effects_drag_ended(value_changed: bool) -> void:
	var bus_index = AudioServer.get_bus_index("SoundEffects")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value_changed))
