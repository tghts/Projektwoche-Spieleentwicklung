extends Enemy

func _process(_delta: float) -> void:
	animated_sprite_2d.animation = "walk"
	if (character.position.x > position.x):
		position.x += 3
		animated_sprite_2d.flip_h = true
		
	if (character.position.x < position.x):
		position.x -= 3
		animated_sprite_2d.flip_h = false

func sprint_angriff():
	animated_sprite_2d.frame = 30
	
