extends Node2D

var bug_scene := preload("res://scenes/bug.tscn")
var spawn_points := []
@onready var node: Node = $Node

func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)

func _on_timer_timeout():
	if Global.wave_start == false:
		return
	if node.get_child_count() > 10:
		node.get_child(0).queue_free()
	#pick random spawn point
	var spawn = spawn_points[randi() % spawn_points.size()]
	#spawn enemy
	var bug = bug_scene.instantiate()
	bug.position = spawn.position
	bug.speed = randi_range(100, 200)
	if spawn.name in ["Marker2D7", "Marker2D8", "Marker2D9"]:
		bug.scale.x = -1
	else: bug.scale.x = 1
	node.add_child(bug)
	
