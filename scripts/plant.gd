class_name plant extends Sprite2D


func _on_button_pressed() -> void:
	if Global.amount_of_water >= 3:
		$Button.disabled = true
		Global.amount_of_water -= randi_range(1, 3)
		Global.plant_hp += 1
	if Global.plant_hp >= Global.max_plant_hp:
		Global.plant_hp = Global.max_plant_hp
	await get_tree().create_timer(3).timeout
	$Button.disabled = false
