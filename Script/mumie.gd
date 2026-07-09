extends Enemy

@onready var character: CharacterBody2D = $"../../Character"

func _process(_delta: float) -> void:
	
	animated_sprite_2d.animation = "walk"
	if (character.position.x > position.x):
		velocity.x = 200
		animated_sprite_2d.flip_h = true
		
	if (character.position.x < position.x):
		velocity.x = -200
		animated_sprite_2d.flip_h = false
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()



func _on_damage_zone_body_entered(body: Node2D) -> void:
	if (body.name =="Character"):
		print("Du hast schaden bekommen")
		GameData.reduce_character_hp()
		body.jump_side(velocity.x*5)
