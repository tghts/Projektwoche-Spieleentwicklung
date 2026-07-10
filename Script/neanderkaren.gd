extends Enemy

@onready var trampolin: Area2D = $"../Trampolin/TrampolineBossKampf/Trampolin"
@onready var trampolin_2: Area2D = $"../Trampolin/TrampolineBossKampf/Trampolin2"
@onready var trampolin_3: Area2D = $"../Trampolin/TrampolineBossKampf/Trampolin3"
@onready var trampolin_4: Area2D = $"../Trampolin/TrampolineBossKampf/Trampolin4"
@onready var trampolin_5: Area2D = $"../Trampolin/TrampolineBossKampf/Trampolin5"
@onready var trampolin_6: Area2D = $"../Trampolin/TrampolineBossKampf/Trampolin6"


@onready var character: CharacterBody2D = $"../Character"
var sprint_state:bool
var velocityc_x = 200
var lives:int = 4

@export var dash_cooldown := 5.0
@export var dash_timer := 0.0

func _ready() -> void:
		trampolin.monitoring = false
		trampolin_2.monitoring = false
		trampolin_3.monitoring = false
		trampolin_4.monitoring = false
		trampolin_5.monitoring = false
		trampolin_6.monitoring = false

func _process(_delta: float) -> void:
	animated_sprite_2d.animation = "walk"
	if (character.position.x > position.x and sprint_state == false):
		velocity.x = velocityc_x
		animated_sprite_2d.flip_h = true
		
	if (character.position.x < position.x and sprint_state == false):
		velocity.x = -velocityc_x
		animated_sprite_2d.flip_h = false
	
	if (sprint_state):
		sprint_angriff()
	
	dash_timer -= _delta
	if dash_timer <= 0.0:
		dash_timer = dash_cooldown
		sprint_state = true
		
func sprint_angriff():
	animated_sprite_2d.speed_scale = 5
	velocityc_x = 600
	
	if (character.position.x > position.x and animated_sprite_2d.flip_h == true):
		velocity.x = velocityc_x
	if (character.position.x < position.x and animated_sprite_2d.flip_h == false):
		velocity.x = -velocityc_x
		
	if (lives == 0):
		queue_free()
		trampolin.show()
		trampolin.monitoring = true
		trampolin_2.show()
		trampolin_2.monitoring = true
		trampolin_3.show()
		trampolin_3.monitoring = true
		trampolin_4.show()
		trampolin_4.monitoring = true
		trampolin_5.show()
		trampolin_5.monitoring = true
		trampolin_6.show()
		trampolin_6.monitoring = true
		
	await get_tree().create_timer(1.5).timeout
	velocityc_x = 200
	sprint_state = false
	animated_sprite_2d.speed_scale = 1
	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _on_damage_zone_body_entered(body: Node2D) -> void:
		if (body.name =="Character"):
			print("Du hast schaden bekommen")
			GameData.reduce_character_hp()
			body.jump_side(velocity.x*13)

func deacrese_lives():
	lives -= 1
	
func get_lives() -> int:
	return lives
