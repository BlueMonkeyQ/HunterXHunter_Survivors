extends CharacterBody2D

var maximum_health: int = 10
var health: int = 10
var movement_speed: float = 200.0

func _physics_process(delta):
	process_movement()
	
func process_movement():
	var x_axis = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_axis = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	var movement = Vector2(x_axis, y_axis)
	velocity = movement.normalized()*movement_speed
	move_and_slide()

func _on_hurt_box_hurt(damage):
	print("Player took Damage: ", damage)
	health -= damage
