extends Node2D

@export var randomize_velocity: bool = true

var size: int = 1

func _ready() -> void:
	if randomize_velocity:
		var magnitude = randf_range(10, 100)
		var direction = randf() * TAU
		$Velocity.velocity = Vector2.from_angle(direction).normalized() * magnitude

func _on_hitpoints_hitpoints_depleted() -> void:
	queue_free()
