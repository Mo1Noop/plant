extends Control

@onready var water: Button = %water
@onready var label: Label = $Label
@onready var help_plant_Button: Button = $help_plant
@onready var plant_hp: Label = $"PLANT HP"
@onready var plant_cooldown: Timer = $plant_cooldown
@onready var auto_get_water: Timer = $auto_get_water

@onready var plant_life_timer: Timer = $plant/plant_life_timer

var amount_of_water : int = 0
var plant_life : int = 10
var max_plant_life : int = 25
var rnd : int = randi_range(1, 3)

func _ready() -> void:
	water.pressed.connect(generate_water)
	help_plant_Button.pressed.connect(help_plant)
	plant_life_timer.timeout.connect(plant_life_time)
	plant_cooldown.timeout.connect(plant_cooldwon_timout)
	update_ui()


func plant_life_time() -> void:
	plant_life -= 1
	update_ui()


func help_plant() -> void:
	help_plant_Button.disabled = true
	plant_cooldown.start()
	if amount_of_water < 3:
		return
	amount_of_water -= rnd
	if plant_life >= max_plant_life:
		plant_life = max_plant_life
		return
	plant_life += 1
	update_ui()


func generate_water() -> void:
	amount_of_water += rnd
	update_ui()


func update_ui() -> void:
	label.text = " WATER: " + str( amount_of_water ) + " "
	plant_hp.text = " PLANT HP: " + str(plant_life) + " "
	if amount_of_water > 30:
		if auto_get_water.is_stopped():
			auto_get_water.start()


func _on_auto_get_water_timeout() -> void:
	amount_of_water += 1
	update_ui()

func plant_cooldwon_timout() -> void:
	help_plant_Button.disabled = false
