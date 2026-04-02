extends State

@export var move: State
@export var idle: State
@export var fall: State

@export var jump_force: float
@export var air_movement_speed: float

func enter() -> void:
	parent.momentum_y = -jump_force
	
func check_physics(delta: float) -> State:
	parent.momentum_y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall
		
	var movement = Input.get_axis("left", "right") * air_movement_speed
	
	#if movement != 0:
		# flip character based on direction
	parent.momentum_x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move
		return idle
		
	return null
	
