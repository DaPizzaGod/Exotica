extends State

@export var idle: State
@export var jump: State
@export var fall: State

var direction: float

@export var ground_speed: float
func check_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump
	return null

func check_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis("left", "right") * ground_speed
	
	if movement == 0:
		return idle
		
	#flip sprite
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall
	return null
