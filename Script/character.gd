extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var healt_points:int = 3
const SPEED = 400.0
const JUMP_VELOCITY = -500.0
var jump_counter = 0

func _physics_process(delta: float) -> void:
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "walking"
	else:
		animated_sprite_2d.animation = "idle"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_counter += 1
		
	if Input.is_action_just_pressed("jump") and !is_on_floor() and jump_counter !=0:
		velocity.y = JUMP_VELOCITY
		jump_counter = 0
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)

	move_and_slide()

	if (direction > 0):
		animated_sprite_2d.flip_h = false
	if (direction < 0):
		animated_sprite_2d.flip_h = true

func jump():
	velocity.y = JUMP_VELOCITY*1.5
