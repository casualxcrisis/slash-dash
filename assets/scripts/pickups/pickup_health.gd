extends AnimatableBody3D




func _on_pickup_area_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		if Global.player_health < 100:
			Global.player_health += 10
		elif Global.player_health == 100:
			Global.player_score += 10
		self.queue_free()
