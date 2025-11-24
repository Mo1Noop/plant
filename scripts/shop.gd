extends Panel

@onready var plant_timer: Timer = $plant_timer
@onready var water_timer: Timer = $water_timer

@onready var auto_water_plant: Button = $"auto water plant"
@onready var auto_collect_water: Button = $"auto collect water"
# the price for the upgrade
var coins_factor_for_plant : float = 12
var coins_factor_for_water : float = 10
# auto add hp and water
var plant_factor : float = 1
var water_factor : float = 1


func _ready() -> void:
	auto_water_plant.tooltip_text = str(coins_factor_for_plant) + " coins"
	auto_collect_water.tooltip_text = str(coins_factor_for_water) + " coins"

#give hp to the plant
func _on_auto_water_plant_pressed() -> void:
	if Global.coin > coins_factor_for_plant:
		Global.coin -= coins_factor_for_plant
		coins_factor_for_plant *= 1.2
		auto_water_plant.tooltip_text = str(coins_factor_for_plant) + " coins"
		if plant_timer.is_stopped():
			plant_timer.start()


func _on_auto_collect_water_pressed() -> void:
	if Global.coin > coins_factor_for_water:
		Global.coin -= coins_factor_for_water
		coins_factor_for_water *= 1.2
		auto_collect_water.tooltip_text = str(coins_factor_for_water) + " coins"
		if water_timer.is_stopped():
			water_timer.start()


# auto do stuff............................

#give hp to the plant..
func _on_plant_timer_timeout() -> void:
	if plant_factor >= 2:
		plant_factor = 2
	if Global.plant_hp >= Global.max_plant_hp:
		Global.plant_hp = Global.max_plant_hp
	Global.plant_hp += plant_factor
	plant_factor *= 1.2
	

# increse amount of water..
func _on_water_timer_timeout() -> void:
	if water_factor >= 2:
		water_factor = 2
	Global.amount_of_water += water_factor
	water_factor *= 1.2
