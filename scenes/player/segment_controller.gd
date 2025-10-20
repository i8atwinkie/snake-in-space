extends Node2D

@onready var parent = get_parent() 

@export var segment_scene: PackedScene

@export var segment_interval: float = 5

var snake_path_points: Array[Vector2] = []

var _children: Array[Node]

func _ready() -> void:
	_children = get_children()

func _physics_process(delta: float) -> void:
	snake_path_points.push_front(parent.global_position)
	if snake_path_points.size() > 100:
		snake_path_points.pop_back()
	
	for i in range(_children.size()):
		if snake_path_points.size() > (i + 1) * 5:
			_children[i].global_position = snake_path_points[(i + 1) * 5]
		elif snake_path_points.size() > 0:
			_children[i].global_position = snake_path_points.back()

func add_segment() -> void:
	var new_segment = segment_scene.instantiate()
	add_child(new_segment)
	_children.append(new_segment)

func remove_segment() -> void:
	if _children.size() > 0:
		_children.back().queue_free()
		_children.pop_back()
