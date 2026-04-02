extends State

@export var idle: State
@export var jump: State
@export var fall: State

@export var ground_max_speed: float
@export var ground_acceleration: float
var movement: float

func check_input(_event: InputEvent) -> State:
	if parent.jump_available:
		if Input.is_action_just_pressed("jump") or parent.jump_buffer:
			return jump
	return null

func check_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_pressed("right"):
		movement = min(movement + ground_acceleration, ground_max_speed)
		
	elif Input.is_action_pressed("left"):
		movement = max(movement - ground_acceleration, -ground_max_speed)
		
	else:
		movement = 0
		return idle
	
	if movement != 0:
		parent.sprite.flip_h = movement < 0
		
		
	
	parent.momentum_x = movement
	
	
	if !parent.is_on_floor():
		return fall
	return null
