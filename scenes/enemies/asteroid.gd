extends Node2D

var size: int = 1

func _on_hitpoints_hitpoints_depleted() -> void:
	queue_free()
