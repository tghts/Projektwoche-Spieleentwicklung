extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var firebreath: PackedScene = preload("res://Scene/fire_breath.tscn")

func _physics_process(delta: float) -> void:

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
func breathfire():
	var fire:= firebreath.instantiate() as Node2D
	add_child(fire)
	fire.global_position = position
