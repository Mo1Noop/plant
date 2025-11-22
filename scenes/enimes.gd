extends Sprite2D

var helth : int = 3

func _on_enemies_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("plant"):
		Global.plant_hp -= 1
