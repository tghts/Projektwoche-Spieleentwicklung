extends Enemy

func _process(_delta: float) -> void:
	animated_sprite_2d.animation = "walk"
	if (character.position.x > position.x):
		velocity.x = 300
		animated_sprite_2d.flip_h = true
		
	if (character.position.x < position.x):
		velocity.x = -300
		animated_sprite_2d.flip_h = false

func sprint_angriff():
	animated_sprite_2d.frame = 30
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
