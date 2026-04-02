extends State

@export var idle: State
@export var jump: State
@export var fall: State

@export var max_speed: float
@export var acceleration: float
var movement: float
func check_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump
	return null

func check_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_pressed("right"):
		movement = min(movement + acceleration, max_speed)
	elif Input.is_action_pressed("left"):
		movement = max(movement - acceleration, -max_speed)
	else:
		return idle
		
	#flip sprite
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall
	return null
