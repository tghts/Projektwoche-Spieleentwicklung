extends Node
@onready var click: AudioStreamPlayer = $AudioStreamPlayer/Click
@onready var music_slider: AudioStreamPlayer = $AudioStreamPlayer/MusicSlider
@onready var sound_effects_slider: AudioStreamPlayer = $AudioStreamPlayer/SoundEffectsSlider
@onready var music: HSlider = $Music
@onready var sound_effects: HSlider = $SoundEffects

func _ready() -> void:
	$Music.grab_focus()
	music.value = GameData.music_volume
	sound_effects.value = GameData.sound_effects_volume

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		_on_back_pressed()

func _on_back_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	click.play()
	if toggled_on:
		fullscreen()
	else:
		windowed()

func fullscreen() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func windowed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_music_value_changed(value: float) -> void:
	music_slider.play()
	GameData.music_volume = value
	var bus_index := AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func _on_sound_effects_value_changed(value: float) -> void:
	sound_effects_slider.play()
	GameData.sound_effects_volume = value
	var bus_index := AudioServer.get_bus_index("SoundEffects")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
