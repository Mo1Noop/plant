extends Node

var plant_hp : float = 5
var max_plant_hp : int = 12
var coin : float = 0

var amount_of_water : float = 5
var holding_pat : bool = false
var wave_start : bool = false

var auto_collect_water : bool = false
var auto_water_plant : bool = false

func reset() -> void:
	plant_hp = 5
	max_plant_hp = 12
	coin = 0

	amount_of_water = 5
	holding_pat = false
	wave_start = false

	auto_collect_water = false
	auto_water_plant = false



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		holding_pat = true
	if event.is_action_released("test"):
		holding_pat = false
