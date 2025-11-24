extends Control


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	Global.reset()

func _on_exit_pressed() -> void:
	get_tree().quit()
