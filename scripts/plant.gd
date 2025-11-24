class_name plant extends Sprite2D

@onready var plant_sprite: Sprite2D = $plant_sprite


func _process(_delta: float) -> void:
	if Global.plant_hp >= 5:
		plant_sprite.frame = 0
	if Global.plant_hp <= 4:
		plant_sprite.frame = 1
	if Global.plant_hp <= 2:
		plant_sprite.frame = 2


func _on_button_pressed() -> void:
	if Global.amount_of_water >= 3:
		$Button.disabled = true
		Global.amount_of_water -= randi_range(1, 3)
		Global.plant_hp += 1
		$WaterPouring.play()
	await get_tree().create_timer(2).timeout
	$Button.disabled = false
