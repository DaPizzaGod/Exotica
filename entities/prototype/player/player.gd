extends CharacterBody2D

@onready var state_machine:= $StateMachine
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	state_machine.start_state_machine(self)
