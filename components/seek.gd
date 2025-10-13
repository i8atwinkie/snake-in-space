class_name Seek extends Node

@export var actor_node: CharacterBody2D
@export var target: Vector2
@export var ratio: float

func seek(delta: float) -> void:
	var desired_change_in_velocity = (target - actor_node.velocity) * delta
	if desired_change_in_velocity.length() > 1:
		actor_node.velocity += desired_change_in_velocity * ratio
	else:
		actor_node.velocity += desired_change_in_velocity
	actor_node.move_and_slide()
