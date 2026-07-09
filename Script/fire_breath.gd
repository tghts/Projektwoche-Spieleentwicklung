extends CharacterBody2D

@export var speed: int = 300.0

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
	if is_on_floor():
		queue_free()

func _on_damage_zone_body_entered(body: Node2D) -> void:
	if (body.name == "Character"):
		print("Du hast schaden bekommen")
		GameData.reduce_character_hp()
		body.jump_side(velocity.x*3)
		SoundManager.play("hit")
