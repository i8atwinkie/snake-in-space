extends Node2D

@export var margin: float = 100

func randomize_position() -> Vector2:
	var bounds = (get_viewport_rect() * get_viewport_transform()).grow(margin)
	var random_side = randf()
	var random_x = 0
	var random_y = 0
	# Left & Right
	if random_side > bounds.size.y / bounds.size.x:
		random_x = [bounds.position.x, bounds.end.x].pick_random()
		random_y = randf_range(bounds.position.y, bounds.end.y)
	# Top & Bottom
	else:
		random_x = randf_range(bounds.position.x, bounds.end.x)
		random_y = [bounds.position.y, bounds.end.y].pick_random()
	
	position = Vector2(random_x, random_y)
	return position
