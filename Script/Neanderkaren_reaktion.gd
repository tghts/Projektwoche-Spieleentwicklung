extends CollisionShape2D

@onready var neanderkaren: Enemy = $"../../../Neanderkaren"



func _on_rechts_body_entered(body: Node2D) -> void:
	if (body.name == "Neanderkaren"):
		neanderkaren.deacrese_lives()
		if (body.get_lives() != 4):
			SoundManager.play("bonk")

func _on_links_body_entered(body: Node2D) -> void:
	if (body.name == "Neanderkaren"):
		neanderkaren.deacrese_lives()
		if(body.get_lives() != 4):
			SoundManager.play("bonk")
