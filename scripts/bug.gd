extends CharacterBody2D

var speed : int = 100
var direction : Vector2

func _ready():
	var screen_rect = get_viewport_rect()
	#pick a direction for the entrance
	var dist = screen_rect.get_center() - position
	if abs(dist.x) > abs(dist.y):
		#move horizontally
		direction.x = dist.x
		direction.y = 0
	else:
		#move vertically
		rotation_degrees = 90
		direction.x = 0
		direction.y = dist.y

func _physics_process(_delta: float) -> void:
	move_and_slide()
	direction = direction.normalized()
	velocity = direction * speed
