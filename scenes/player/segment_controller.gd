extends Node2D

@onready var _children = get_children()

@export var segment_scene: PackedScene
@export var segment_length: float = 20

var snake_path: SnakePath = SnakePath.new()

func _physics_process(_delta: float) -> void:
	snake_path.push_front(global_position)
	
	for i in range(_children.size()):
		_children[i].global_position = snake_path.get_position_at_distance(i * segment_length)

func add_segment() -> void:
	var new_segment = segment_scene.instantiate()
	add_child(new_segment)
	_children.append(new_segment)

func remove_segment() -> void:
	if _children.size() > 0:
		_children.back().queue_free()
		_children.pop_back()
