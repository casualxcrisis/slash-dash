extends AnimatableBody3D




func _on_pickup_area_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		Global.player_health += 10
		self.queue_free()
