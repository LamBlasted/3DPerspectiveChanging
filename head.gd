extends Node3D


@export var mouse_sensitivity: float = 0.0005

var yaw: float = 0.0  # Left/right rotation

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Only rotate around the Y axis (yaw)a
		yaw -= event.relative.x * mouse_sensitivity
		yaw = wrapf(yaw, -PI, PI)

		# Apply only yaw — no pitch (X), no roll (Z)
		rotation = Vector3(0.0, yaw, 0.0)

	
