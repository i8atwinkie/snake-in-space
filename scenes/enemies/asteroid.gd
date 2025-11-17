extends Node2D

@export var randomize_velocity: bool = true

func _ready() -> void:
	if randomize_velocity:
		var magnitude = randf_range(10, 100)
		# $Velocity.velocity = Vector2.from_angle(direction).normalized() * magnitude
		
		#var viewport_rect = get_viewport_rect()
		#var viewport_transform = get_viewport_transform()
		#var random_x = randf() * viewport_rect.size.x * viewport_transform.x
		#var random_y = randf() * viewport_rect.size.y * viewport_transform.y
		#$Velocity.velocity = position.direction_to(Vector2(random_x, random_y)) * magnitude
		$Velocity.velocity = position.direction_to(get_viewport().get_camera_2d().get_screen_center_position()) * magnitude


func _on_hitpoints_hitpoints_depleted() -> void:
	queue_free()
