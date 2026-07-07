extends Control
@onready var label: Panel = $Label


func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("esc")
	if (esc_pressed==true):
		get_tree().paused = true
		label.show()
