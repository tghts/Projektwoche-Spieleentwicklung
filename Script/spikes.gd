extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if(body.name == "Character"):
		SoundManager.play("hit")
		GameData.reduce_character_hp()
		body.jump_side(120)
