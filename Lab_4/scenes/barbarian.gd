extends RigidBody3D


func _ready() -> void:
	$Barbarian/AnimationPlayer.play("Idle")



func _process(delta) -> void:
	var input = Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forvad", "move_back")

	if input.length_squared() > 0:
		var target_rotation = atan2(input.x, input.z)
		$Barbarian.rotation.y = lerp_angle($Barbarian.rotation.y, target_rotation, 10 * delta)
		$Barbarian/AnimationPlayer.play("Running_B")
	else:
		$Barbarian/AnimationPlayer.queue("Idle")
	apply_central_force(input * 1200 * delta)


		
func _on_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.pressed:
			$Barbarian/AnimationPlayer.play("1H_Melee_Attack_Chop")
		elif mouse_event.button_index == MOUSE_BUTTON_RIGHT and mouse_event.pressed:
			$Barbarian/AnimationPlayer.play("1H_Melee_Attack_Chop")


func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			$Barbarian/AnimationPlayer.play("1H_Melee_Attack_Slice_Diagonal")
			print("--------------------good")
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			$Barbarian/AnimationPlayer.play("1H_Melee_Attack_Chop")
			print("good--------------------")


