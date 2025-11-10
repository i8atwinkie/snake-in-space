@tool
class_name DrawCircle extends Node2D

@export var radius: float = 10
@export var outline_width: float = 2
@export var fill_color: Color = Color.WHITE
@export var outline_color: Color = Color.GRAY

func _draw():
	draw_circle(position, radius, outline_color, true)
	draw_circle(position, radius - outline_width, fill_color, true)
