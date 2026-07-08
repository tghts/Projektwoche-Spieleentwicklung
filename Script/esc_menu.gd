extends Control
@onready var label: Panel = $Label
@onready var click: AudioStreamPlayer = $AudioStreamPlayer/Click
@onready var pause: AudioStreamPlayer = $AudioStreamPlayer/Pause

func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("esc")
	if esc_pressed:
		pause.play()
		get_tree().paused = true
		label.show()
