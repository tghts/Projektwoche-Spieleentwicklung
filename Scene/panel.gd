extends Panel

@onready var bar: TextureRect = $TextureRect
@onready var character: CharacterBody2D = $"../Node2D"





func _process(delta: float) -> void:
	bar.size.x = character.health_points * 5
	if (character.health_points == 0):
		get_tree().reload_current_scene()
