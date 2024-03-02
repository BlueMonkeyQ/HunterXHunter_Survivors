extends Area2D

@export var damage: int = 1
@onready var collision = $CollisionShape2D
@onready var i_frame = $iFrame

func tempdisable():
	collision.call_deferred("set", "disabled", true)
	i_frame.start()
	
func _on_i_frame_timeout():
	collision.call_deferred("set", "disabled", false)
