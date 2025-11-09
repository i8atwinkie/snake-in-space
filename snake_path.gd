class_name SnakePath

var _max_points: int = 100
var _points: Array[Vector2] = []

func push_front(point_position: Vector2) -> void:
	_points.push_front(point_position)
	if _points.size() > _max_points:
		_points.pop_back()

func get_position_at_distance(distance) -> Vector2:
	for i in range(_points.size() - 1):
		var distance_between_points = (_points[i] - _points[i + 1]).length()
		if distance <= distance_between_points:
			return _points[i].lerp(_points[i + 1], 1 - (distance_between_points - distance) / distance_between_points)
		distance -= distance_between_points
	return _points[-1]

#func get_length() -> float:
	#var length = 0
	#for i in range(_points.size() - 1):
		#length += 
