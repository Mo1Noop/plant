extends Node

var plant_hp : int = 10
var max_plant_hp : int = 25

var amount_of_water : int = 5
var holding_pat : bool = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		holding_pat = true
	if event.is_action_released("test"):
		holding_pat = false
