extends CharacterBody2D

@onready var state_machine:= $StateMachine

func _ready() -> void:
	state_machine.start_state_machine(self)
