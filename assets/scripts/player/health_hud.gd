extends Label

func _process(delta: float) -> void:
	var health_string = var_to_str(Global.player_health)
	%Health.set_text("Health: " + health_string)
