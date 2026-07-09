extends Area2D

func _on_body_entered(body: Node2D) -> void:
	SoundManager.play("hit")
	GameData.reduce_character_hp()
