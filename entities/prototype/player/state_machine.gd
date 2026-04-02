extends Node

@export var starting_state: State

var current_state: State

func start_state_machine(parent: CharacterBody2D) -> void:
	for i in get_children():
		i.parent = parent
		
	change_state(starting_state)
	
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()

func _physics_process(delta: float) -> void:
	var new_state = current_state.check_physics(delta)
	if new_state:
		change_state(new_state)
	
		
func _input(event: InputEvent) -> void:
	var new_state = current_state.check_input(event)
	if new_state:
		change_state(new_state)
		
func _process(delta: float) -> void:
	var new_state = current_state.check_frame(delta)
	if new_state:
		change_state(new_state)
