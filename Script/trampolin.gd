extends Area2D

@export var bounce_force: float = 1.5

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Character" and body.velocity.y > 0):
		SoundManager.play("trampolin")
		body.jump(bounce_force)
