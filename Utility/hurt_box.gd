extends Area2D

@export_enum("cooldown", "one") var HurtBoxType = 0

@onready var collision = $CollisionShape2D
@onready var i_frame = $iFrame

signal hurt(damage)


func _on_area_entered(area):
	if area.is_in_group("attack"):
		if not area.get("damage") == null:
			match HurtBoxType:
				0:
					collision.call_deferred("set", "disabled", true)
					i_frame.start()
					
				1:
					pass
					
				2:
					if area.has_method("tempdisabled"):
						area.tempdisabled()
						
			var damage = area.damage
			emit_signal("hurt", damage)


func _on_i_frame_timeout():
	collision.call_deferred("set", "disabled", false)
