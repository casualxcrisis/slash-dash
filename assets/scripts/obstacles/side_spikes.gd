extends Area3D

@export_category("Damage")
@export var spike_dmg = 5


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		Global.player_health -= spike_dmg
