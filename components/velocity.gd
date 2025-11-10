class_name Velocity extends Node

@export var actor_node: Node2D

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	actor_node.position += velocity * delta
