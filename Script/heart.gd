extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Character"):
		GameData.add_character_hp()
		SoundManager.play("heart")
		queue_free()
