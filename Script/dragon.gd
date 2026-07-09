extends CharacterBody2D

@onready var character: CharacterBody2D = $"../Character"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var firebreath: PackedScene = preload("res://Scene/fire_breath.tscn")

@export var breath_cooldown := 10.0
@export var breath_timer := 0.0

func _physics_process(delta: float) -> void:
	animated_sprite_2d.animation = "flying"
	position.y = -585
	if (character.position.x > position.x):
		velocity.x = 150
		animated_sprite_2d.flip_v = true
		
	if (character.position.x < position.x):
		velocity.x = -150
		animated_sprite_2d.flip_v = false
		
	breath_timer -= delta
	if breath_timer <= 0.0:
		breath_timer = breath_cooldown
		breathfire()

	move_and_slide()

func breathfire():
	var fire := firebreath.instantiate() as Node2D
	add_child(fire)
	fire.global_position = global_position

	fire.look_at(character.global_position)


func _on_damage_zone_body_entered(body: Node2D) -> void:
	if (body.name =="Character"):
		print("Du hast schaden bekommen")
		GameData.reduce_character_hp()
		body.jump_side(velocity.x*13)
