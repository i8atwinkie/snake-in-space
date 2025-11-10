class_name Hitpoints extends Node

signal hitpoints_depleted
signal damaged
signal healed

@export var vulnerable: bool = true
@export var max_hitpoints: int = 1
@export var current_hitpoints: int = 1:
	get:
		return current_hitpoints
	set(value):
		current_hitpoints = value
		if max_hitpoints > 0:
			if current_hitpoints > max_hitpoints:
				current_hitpoints = max_hitpoints
		if current_hitpoints <= 0:
			emit_signal("hitpoints_depleted")

func damage(amount) -> bool:
	if vulnerable:
		current_hitpoints -= amount
		emit_signal("damaged", amount)
		return true
	return false

func heal(amount) -> int:
	var old_hitpoints = current_hitpoints
	current_hitpoints += amount
	if current_hitpoints > old_hitpoints:
		emit_signal("healed", current_hitpoints - old_hitpoints)
		return current_hitpoints - old_hitpoints
	return 0

func _on_hurtbox_area_entered(area: Area2D) -> void:
	# damage(area.damage)
	print("owie")
