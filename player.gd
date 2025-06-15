extends RigidBody3D

var mouse_sensitivity := 0.001
var twist_input := 0.0
var move_speed := 2.0  # Adjust this value as needed

func _ready() -> void: 
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	# Make sure these physics properties are set correctly
	freeze_mode = RigidBody3D.FREEZE_MODE_KINEMATIC  # This might be needed depending on your setup
	gravity_scale = 1.0  # Set to 0 if you don't want gravity

func _physics_process(delta: float) -> void:  # Changed to _physics_process for physics operations
	var input := Vector3.ZERO 
	input.x = Input.get_axis("move_left", "move_right") 
	input.z = Input.get_axis("move_forward", "move_back")

	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Normalize input if it exceeds length of 1 (diagonal movement)
	if input.length_squared() > 1:
		input = input.normalized()

	# Transform the input direction to be relative to the player's orientation
	var movement_direction = transform.basis * input

	# Apply force for movement - increased force magnitude
	apply_central_force(movement_direction * move_speed * 1000.0 * delta)
	
	# Apply rotation and reset twist_input
	rotate_y(twist_input)
	twist_input = 0.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			twist_input = -event.relative.x * mouse_sensitivity
