extends Control

@onready var water_Button: Button = %water
@onready var label: Label = $Label
@onready var help_plant_Button: Button = $help_plant
@onready var plant_hp: Label = $"PLANT HP"
@onready var plant_cooldown: Timer = $plant_cooldown
@onready var auto_get_water: Timer = $auto_get_water
@onready var pat: ColorRect = %pat
@onready var marker: Marker2D = $Node/Marker2D
@onready var plant_life_timer: Timer = $plant/plant_life_timer
@onready var pat_hit_box: Area2D = $pat/pat_hitBox

var amount_of_water : int = 0
var plant_life : int = 10
var max_plant_life : int = 25
var rnd : int = randi_range(1, 3)
var holding_pat : bool = false

func _ready() -> void:
	water_Button.pressed.connect(generate_water)
	help_plant_Button.pressed.connect(help_plant)
	plant_life_timer.timeout.connect(plant_life_time)
	plant_cooldown.timeout.connect(plant_cooldwon_timout)
	pat_hit_box.area_entered.connect(pat_hitBox)
	update_ui()

func _process(_delta: float) -> void:
	if holding_pat:
		pat.global_position.x = get_global_mouse_position().x - 15
		pat.global_position.y = get_global_mouse_position().y - 15
	else:
		if pat.global_position != marker.global_position:
			pat.global_position = marker.global_position


func plant_life_time() -> void:
	plant_life -= 1
	update_ui()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		holding_pat = true
	if event.is_action_released("test"):
		holding_pat = false
	if event.is_action_pressed("help_plant"):
		pat_hit_box.monitoring = true
	if event.is_action_released("help_plant"):
		pat_hit_box.monitoring = false


func pat_hitBox(area : Area2D) -> void:
	print(area)
	if area == $Node/bugs/ColorRect/bug_hurtBox:
		print(" give damge ")
		take_damge()

func take_damge() -> void:
	print(" take damge ")


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
	amount_of_water += 1
	water_Button.disabled = true
	update_ui()
	await get_tree().create_timer(3).timeout
	water_Button.disabled = false


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
