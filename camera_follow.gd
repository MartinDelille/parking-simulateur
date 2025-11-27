extends Node3D

@export var target_path: NodePath
var target: Node3D


func _ready() -> void:
	if target_path:
		target = get_node(target_path)


func _process(_delta: float) -> void:
	if target:
		global_position = target.global_position
