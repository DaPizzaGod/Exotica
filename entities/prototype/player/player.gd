extends CharacterBody2D

@onready var state_machine:= $StateMachine
@onready var sprite: Sprite2D = $Sprite2D
var momentum_x: float
var momentum_y: float

func _ready() -> void:
	state_machine.start_state_machine(self)

func _physics_process(delta: float) -> void:
	velocity = Vector2(momentum_x, momentum_y)
	move_and_slide()
