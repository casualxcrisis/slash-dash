extends RayCast3D

@export_category("Attack")
@export var attack_range = 6.0


func _ready() -> void:
		set_collide_with_bodies(true)
		set_target_position(Vector3.FORWARD * attack_range)
		%Slash.visible = false
	
func _physics_process(delta: float) -> void:
	var enemy = get_collider()
	if is_colliding() && enemy.is_in_group("enemy"):
		%Slash.visible = true
	if Input.is_action_just_pressed("attack") && is_colliding() && enemy.is_in_group("enemy"):
			get_collider().queue_free()
			%Slash.visible = false
			Global.player_score += 100
		

#debug printing
func _process(delta: float) -> void:
	print(is_colliding())
	#print(get_collider())
	
	
	
	
