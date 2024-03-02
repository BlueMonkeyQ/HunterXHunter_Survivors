extends Area2D

var level: int = 1
var damage: float = 1.0
var cooldown: float = 0.5

@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	# Finds all 2d body nodes that are overlapping with the fishing pole area
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		var target = enemies_in_range[0]
		look_at(target.global_position)



	
