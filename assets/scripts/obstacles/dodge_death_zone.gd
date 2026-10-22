extends Area3D


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		print("You died!")
		get_tree().call_deferred("change_scene_to_file", "res://levels/temp_game_over.tscn")
		get_tree().change_scene_to_file.call_deferred("res://levels/temp_game_over.tscn")
