class_name DrawVector extends Node2D

@export var vector: Vector2 = Vector2.RIGHT:
	set(value):
		vector = value
		queue_redraw()

func _draw() -> void:
	draw_line(position, vector, Color.WHITE)
	draw_line(vector, vector + Vector2.from_angle(vector.angle() + TAU * (3.0/8.0)) * 10, Color.WHITE)
	draw_line(vector, vector + Vector2.from_angle(vector.angle() - TAU * (3.0/8.0)) * 10, Color.WHITE)
