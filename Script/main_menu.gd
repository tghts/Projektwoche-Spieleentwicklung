extends Node
@onready var sphinx: Control = $Sphinx
@onready var start: Button = $Startknopf

func _ready():
	start.grab_focus()

func _on_startknopf_pressed() -> void:
	SoundManager.play("click")
	GameData.reset_character_hp()
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")

func _on_exitknopf_pressed() -> void:
	SoundManager.play("click")

	await get_tree().create_timer(0.2).timeout

	get_tree().quit()

func _on_settingknopf_pressed() -> void:
	SoundManager.play("click")
	get_tree().change_scene_to_file("res://Scene/settings.tscn")

func _on_abc_toggled(toggled_on: bool) -> void:
	if toggled_on:
		sphinx.show()
		SoundManager.play("appear")
	else:
		sphinx.hide()
		SoundManager.play("disappear")
