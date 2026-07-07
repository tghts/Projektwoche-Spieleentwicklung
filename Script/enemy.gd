class_name Enemy

extends RigidBody2D

@onready var in_game_ui: Node = %InGameUI
@onready var character: CharacterBody2D = %Character

@export var health_ponits: int = 3 
@export var atack_damage: int = 1  
