extends State

@export var move: State
@export var idle: State

@export var fall_movement_speed: float
func check_physics(delta: float) -> State:
	
	parent.momentum_y += gravity * delta
	
	var movement = Input.get_axis("left", "right") * fall_movement_speed
	
	#if movement != 0:
		#flip sprite
	parent.momentum_x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move
		return idle
	return null
