extends Node

@onready var character: CharacterBody2D = %Character

var lives:int = 2

@export var hearts : Array[Node]
func _process(delta: float) -> void:
	display_lives()
	
func display_lives():
	for n in lives:
		hearts[n].show()
func dectrease_health():
	lives -= 1 
