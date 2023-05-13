extends Spatial

var speed : float = 15 # Adjust to get the right feel for your game

func _process(delta):
	var direction = Vector3()

	if Input.is_action_pressed("cLeft"):
		direction -= transform.basis.z
	if Input.is_action_pressed("cRight"):
		direction += transform.basis.z
	if Input.is_action_pressed("cDown"):
		direction -= transform.basis.x
	if Input.is_action_pressed("cUp"):
		direction += transform.basis.x

	# Normalize the direction vector to avoid faster diagonal movement
	direction = direction.normalized()

	# Move the camera
	translate(direction * speed * delta)

	if Input.is_action_just_released("MouseWheelUp"):
		if $Camera.global_translation.distance_to(global_translation) > 20:
			$Camera.global_translation -= $Camera.global_transform.basis.z * 2

	if Input.is_action_just_released("MouseWheelDown"):
		if $Camera.global_translation.distance_to(global_translation) < 50:
			$Camera.global_translation += $Camera.global_transform.basis.z * 2
