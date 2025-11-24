extends Sprite2D


func _on_water_button_pressed() -> void:
	Global.amount_of_water += 1
	$Water.play()
	$water_Button.disabled = true
	self_modulate = Color(0.656, 0.656, 0.656, 1.0)
	await get_tree().create_timer(1.5).timeout
	$water_Button.disabled = false
	self_modulate = Color(1.0, 1.0, 1.0, 1.0)
