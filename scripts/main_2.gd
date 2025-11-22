extends Control


func _on_plant_hp_timeout() -> void:
	Global.plant_hp -= 1
