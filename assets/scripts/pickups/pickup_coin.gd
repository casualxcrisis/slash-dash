extends AnimatableBody3D

@export_group("Score")
@export var coin_value = 15

func _on_pickup_area_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		Global.player_score += coin_value
		print("Coin picked up. Score: ", Global.player_score)
		self.queue_free()
