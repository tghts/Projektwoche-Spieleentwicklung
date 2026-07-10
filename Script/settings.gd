extends Node

signal back_requested

@onready var music: HSlider = $Music
@onready var sound_effects: HSlider = $SoundEffects

var opened_from_pause := false

func _ready() -> void:
	music.grab_focus()
	music.value = GameData.music_volume
	sound_effects.value = GameData.sound_effects_volume

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		_on_back_pressed()

func _on_back_pressed() -> void:
	SoundManager.play("click")

	if opened_from_pause:
		back_requested.emit()
	else:
		get_tree().change_scene_to_file("res://Scene/main_menu.tscn")

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	SoundManager.play("click")

	if toggled_on:
		fullscreen()
	else:
		windowed()

func fullscreen() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func windowed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_music_value_changed(value: float) -> void:
	SoundManager.play("slider")
	GameData.music_volume = value

	var bus_index := AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func _on_sound_effects_value_changed(value: float) -> void:
	SoundManager.play("slider")
	GameData.sound_effects_volume = value

	var bus_index := AudioServer.get_bus_index("SoundEffects")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
