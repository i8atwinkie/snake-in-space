class_name InverseKinematics extends Node

@export var actor: Node2D
@export var following: Node2D

@export var distance: float = 20

func _ready() -> void:
	if actor == null:
		actor = get_parent()
	actor.top_level = true

func _physics_process(delta: float) -> void:
	follow()

func follow():
	if following != null:
		#if actor.global_position.distance_to(following.global_position) > distance:
		actor.global_position = following.global_position - (actor.global_position.direction_to(following.global_position) * distance)
