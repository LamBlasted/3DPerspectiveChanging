extends SpringArm3D

@export var look_speed: float = 1.5
@export_range( -90.0, 0.0, 0.1, "radians_as_degrees") var min_vertical_angle : float = -PI/2
@export_range( 0.0, 90.0, 0.1, "radians_as_degrees") var max_vertical_angle : float = PI/4


func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_window().grab_focus()
	spring_length -= 4


func _process(delta: float) -> void:
	var horizontal_input := 0.0
	if Input.is_action_pressed("camera_left"):
		horizontal_input += 1.0
	if Input.is_action_pressed("camera_right"):
		horizontal_input -= 1.0

	rotation.y += horizontal_input * look_speed * delta
	rotation.y = wrapf(rotation.y, 0.0, TAU)
