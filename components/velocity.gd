class_name Velocity extends Node

@export var actor_node: Node2D

var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	if actor_node == null:
		actor_node = get_parent()

func _physics_process(delta: float) -> void:
	actor_node.position += velocity * delta
