extends CanvasLayer

@onready var water_text_2: Label = $Panel/water_text/water_text2
@onready var plant_text_2: Label = $Panel/plant_text/plant_text2
@onready var coins_text_2: Label = $Panel/coins_text/coins_text2
@onready var score_text_2: Label = $Panel/score_text/score_text2

@onready var shop_anim: AnimationPlayer = $shop/shop_anim
var score : float = 0

func _process(delta: float) -> void:
	score += delta * 2
	water_text_2.text = str( int(Global.amount_of_water) ) + "  "
	plant_text_2.text = str( int(Global.plant_hp) ) + "  "
	coins_text_2.text = str( int(Global.coin) ) + "  "
	score_text_2.text = str( int(score) ) + "  "


func _on_shop_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$press_f.visible = false
		shop_anim.play("shop")
	else:
		$press_f.visible = true
		shop_anim.play_backwards("shop")
