extends Node
@onready var click: AudioStreamPlayer = $AudioStreamPlayer/Click
@onready var appear: AudioStreamPlayer = $AudioStreamPlayer/Appear
@onready var disappear: AudioStreamPlayer = $AudioStreamPlayer/Disappear
@onready var sphinx: Control = $Sphinx

func _ready():
	$Startknopf.grab_focus()

func _on_startknopf_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")

func _on_exitknopf_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()

func _on_settingknopf_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scene/settings.tscn")

func _on_abc_toggled(toggled_on: bool) -> void:
	if toggled_on:
		sphinx.show()
		appear.play()
	else:
		sphinx.hide()
		disappear.play()
