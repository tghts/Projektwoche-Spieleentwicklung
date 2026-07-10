extends Node
@onready var sphinx: Control = $Sphinx
@onready var start: Button = $Startknopf

var level_selector_button_presses: int = 0
func _ready():
	start.grab_focus()

func _on_startknopf_pressed() -> void:
	SoundManager.play("click")
	GameData.reset_character_hp()
	GameData.reset_zahnrad()
	get_tree().change_scene_to_file("res://Scene/level_1.scn")

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

func _on_credits_pressed() -> void:
	SoundManager.play("click")
	get_tree().change_scene_to_file("res://Scene/credits.tscn")

func _on_level_selection_pressed() -> void:
	level_selector_button_presses += 1
	if (level_selector_button_presses == 3):
		get_tree().change_scene_to_file("res://Scene/level_selector.tscn")
