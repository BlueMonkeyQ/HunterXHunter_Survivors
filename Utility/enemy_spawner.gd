extends Node2D

@export var spawns: Array[Spawn_info] = []

@onready var player = get_tree().get_first_node_in_group("player")

var time = 0

# Using the Timer node. Spawns enemies based on if they meet the their respective spawning criteria
func _on_timer_timeout():
	time += 1
	
	var enemy_spawns = spawns
	for i in enemy_spawns:
		
		if time >= i.time_start and time <= i.time_end:
			
			if i.spawn_delay_counter < i.spawn_delay:
				i.spawn_delay_counter += 1
				
			else:
				i.spawn_delay_counter = 0
				var new_enemy = i.enemy
				var counter: int = 0
				
				while counter < i.spawn_count:
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawn.global_position = enemy_spawn_postion()
					add_child(enemy_spawn)
					counter += 1

# Spawns the enemy in a random position around the player current position
func enemy_spawn_postion():
	var vpr = get_viewport_rect().size * randf_range(1.1, 1.4)
	var top_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y - vpr.y/2)
	var top_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var bottom_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y + vpr.y/2)
	var bottom_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y + vpr.y/2)
	
	var position_sides = ["up", "down", "right", "left"].pick_random()
	
	var spawn_position_one = Vector2.ZERO
	var spawn_position_two = Vector2.ZERO
	
	match position_sides:
		"up":
			spawn_position_one = top_left
			spawn_position_two = top_right
			
		"down":
			spawn_position_one = bottom_left
			spawn_position_two = bottom_right
			
		"right":
			spawn_position_one = top_right
			spawn_position_two = bottom_right
			
		"left":
			spawn_position_one = top_left
			spawn_position_two = bottom_left
			
	var spawn_x_axis = randf_range(spawn_position_one.x, spawn_position_two.x)
	var spawn_y_axis = randf_range(spawn_position_one.y, spawn_position_two.y)
	return Vector2(spawn_x_axis, spawn_y_axis)
