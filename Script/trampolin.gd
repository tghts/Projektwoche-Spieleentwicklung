extends Area2D
@onready var trampolin: AudioStreamPlayer = $AudioStreamPlayer/Trampolin

func _on_body_entered(body: Node2D) -> void:
	trampolin.play()
	if (body.name == "Character"):
		body.jump()
