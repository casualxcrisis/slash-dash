extends Timer

func _ready() -> void:
	%GameTimer.wait_time = Global.base_time
	%GameTimer.autostart = true

func _on_hurt_pickup_zone_body_entered(body: Node3D) -> void:
	#enemy removes time
	if body.is_in_group("enemy"):
		%GameTimer.start(%GameTimer.time_left - Global.enemy_dmg)
		body.queue_free()
	#pickup adds time
	if body.is_in_group("time_pickup"):
		if %GameTimer.time_left <= 70:
			%GameTimer.start(%GameTimer.time_left + Global.base_time_pickup)
		elif %GameTimer.time_left > 71:
			if %GameTimer.time_left < 79:
				%GameTimer.start(%GameTimer.time_left + 2.0)
			elif %GameTimer.time_left >= 79:
				%GameTimer.start(%GameTimer.time_left + 1.0)
		body.queue_free()
