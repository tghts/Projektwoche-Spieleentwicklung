extends CharacterBody2D

@onready var character: CharacterBody2D = $"../Character"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var firebreath: PackedScene = preload("res://Scene/fire_breath.tscn")

func _process(delta: float) -> void:
	animated_sprite_2d.animation = "flying"
	if (character.position.x > position.x):
		velocity.x = 200
		animated_sprite_2d.flip_h = true
		
	if (character.position.x < position.x):
		velocity.x = -200
		animated_sprite_2d.flip_h = false
	
func breathfire():
	var fire:= firebreath.instantiate() as Node2D
	add_child(fire)
	fire.global_position = position
