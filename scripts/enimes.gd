extends Sprite2D

var helth : int = 3
@onready var helth_bar: ProgressBar = $helth_Bar


func _ready() -> void:
	helth_bar.max_value = helth
	helth_bar.value = helth

func update_helth_bar() -> void:
	helth_bar.value = helth

func _on_enemies_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("plant"):
		Global.plant_hp -= 1
