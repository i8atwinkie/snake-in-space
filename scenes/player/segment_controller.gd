extends Node2D

@export var segment_scene: PackedScene

var _children: Array[Node]

func _ready() -> void:
	_children = get_children()

func add_segment() -> void:
	var new_segment = segment_scene.instantiate()
	var inverse_kinematics_component = new_segment.get_node("./InverseKinematics") as InverseKinematics
	if _children.size() > 0:
		inverse_kinematics_component.following = _children.back()
	else:
		inverse_kinematics_component.following = self
	add_child(new_segment)
	_children.append(new_segment)

func remove_segment() -> void:
	if _children.size() > 0:
		_children.back().queue_free()
		_children.pop_back()
