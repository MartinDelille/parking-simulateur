extends Node3D

@export var speed: float = 10.0
@export var rotation_speed: float = 3.0

func _process(delta: float) -> void:
	var input_dir := Vector3.ZERO
	
	# Forward/Backward movement (W/S)
	if Input.is_key_pressed(KEY_W):
		input_dir.z -= 1
	if Input.is_key_pressed(KEY_S):
		input_dir.z += 1
	
	# Rotation (A/D)
	if Input.is_key_pressed(KEY_A):
		rotate_y(rotation_speed * delta)
	if Input.is_key_pressed(KEY_D):
		rotate_y(-rotation_speed * delta)
	
	# Move in the direction the car is facing
	if input_dir != Vector3.ZERO:
		var direction = transform.basis * input_dir.normalized()
		position += direction * speed * delta
