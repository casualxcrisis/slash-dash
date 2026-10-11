extends CharacterBody3D

@export_group("Movement")
var speed = Global.run_speed
@export var fall_acceleration = 75
@export var jump_impulse = 20

#defining 3 possible lanes for the player to occupy 
enum Lane {LEFT = 1, CENTER = 0, RIGHT = -1}
enum State {RUNNING, JUMPING, ATTACKING, DEAD}

var target_lane : int = Lane.CENTER
var current_lane : int = Lane.CENTER

#handling speed of changing lanes as well as the lane width
@export_group("Lane Change Speed")
var lane_width = 2.0 #doesn't need to change, this keeps us at three defined lanes
@export var lane_change_speed = 5.0

#set target velocity variable to allow jump
var target_velocity = Vector3.ZERO



func _physics_process(delta: float) -> void:
	#handle jump
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse
	
	#lane switching
	var target_x = target_lane * lane_width
	position.x = lerp(position.x, target_x, lane_change_speed * delta)
	
	if Input.is_action_just_pressed("move_left") and target_lane > Lane.RIGHT:
		target_lane -= 1
	if Input.is_action_just_pressed("move_right") and target_lane < Lane.LEFT:
		target_lane += 1
	
	#auto run
	target_velocity.z = speed
	
	#set movement
	velocity = target_velocity
	move_and_slide()



	
