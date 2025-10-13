class_name Circle extends Node2D

@export var radius: float = 10

func _draw():
	draw_circle(position, radius, Color.WHITE, true)
