class_name Hurtbox extends Area2D

@export var faction: Faction.Factions

signal hurt(damage: int)

func _ready() -> void:
	connect("area_entered", func(area: Area2D) -> void:
		var hitbox = area as Hitbox
		if hitbox.faction != faction:
			emit_signal("hurt", hitbox.damage)
	)
