class_name Enemy

extends RigidBody2D

@onready var character: CharacterBody2D = $"../Character"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var health_ponits: int = 3 
@export var atack_damage: int = 1  

func _process(_delta: float) -> void:
	animated_sprite_2d.animation = "walk"
	if (character.position.x > position.x):
		position.x += 3
		animated_sprite_2d.flip_h = true
		
	if (character.position.x < position.x):
		position.x -= 3
		animated_sprite_2d.flip_h = false
