class_name bat extends Sprite2D

@onready var marker: Marker2D = %Marker



func _process(delta: float) -> void:
	if Global.holding_pat:
		global_position = lerp(
			global_position, get_global_mouse_position(), 25 * delta)
	else:
		if global_position != marker.global_position:
			global_position = lerp(
				global_position, marker.global_position, 25 * delta)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("help_plant"):
		$bat_area.monitoring = true
	elif event.is_action_released("help_plant"):
		$bat_area.monitoring = false


func _on_bat_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.get_parent().helth -= 1
		print(area.get_parent().helth)
		if area.get_parent().helth < 1:
			area.get_parent().queue_free()
