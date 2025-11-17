class_name Spawner extends Node2D

@export var scene: PackedScene

func spawn() -> void:
	var object = scene.instantiate()
	object.global_position = global_position
	get_tree().get_root().add_child(object)
