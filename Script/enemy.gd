class_name Enemy

extends RigidBody2D

@onready var in_game_ui: Node = %InGameUI
@onready var character: CharacterBody2D = %Character

@export var health_ponits: int = 3 
@export var atack_damage: int = 1  



func _on_damage_zone_body_entered(body: Node2D) -> void:
	in_game_ui.dectrease_health()
