extends State


@export var move: State
@export var jump: State
@export var fall: State

@export var deceleration: float

func enter() -> void:
	#parent.momentum_x = move_toward(parent.velocity.x, 0.0, deceleration)
	var tween := create_tween()
	tween.tween_property(parent, "momentum_x", 0, 0.1)

func check_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		return move
	return null

func check_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall
	return null
