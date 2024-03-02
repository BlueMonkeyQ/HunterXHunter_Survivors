extends CharacterBody2D

@export var movement_speed: float = 70.0
@export var maximum_health: int = 3
@export var health: int = 3

# Onready is used to reference nodes once a node has loaded
@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	var player_direction = global_position.direction_to(player.global_position)
	velocity = player_direction*movement_speed
	move_and_slide()


func _on_hurt_box_hurt(damage):
	print("Enemy took Damage: ", damage)
	health -= damage
	if health <= 0:
		queue_free()
