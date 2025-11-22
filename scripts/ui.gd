extends CanvasLayer

@onready var water_text: Label = $Panel/water_text
@onready var plant_text: Label = $Panel/plant_text
@onready var day_text: Label = $Panel/day_text



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	water_text.text = "  WATER: " + str( Global.amount_of_water ) + "  "
	plant_text.text = "  PLANT: " + str( Global.plant_hp ) + "  "
	#plant_text.text = "  day: " + str( Global.plant_hp ) + "  "
