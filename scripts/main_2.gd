extends Control

func _ready() -> void:
	get_tree().paused = true


func _on_plant_hp_timeout() -> void:
	Global.plant_hp -= 1
	if Global.plant_hp < 1:
		$lose_scene.visible = true
		$plant_hp.stop()
		get_tree().paused = true


func _on_enmy_timer_timeout() -> void:
	var rnd: float = randf()
	if rnd < 0.4:
		Global.wave_start = false
	else:
		Global.wave_start = true


func _on_restart_pressed() -> void:
	get_tree().paused = false
	$restart.visible = false
