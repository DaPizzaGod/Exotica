class_name State
extends  Node



var gravity:= 900

var parent: CharacterBody2D

func enter() -> void:
	pass #play animation?
	# maybe set up animation tree workflow

func exit() -> void:
	pass


func check_physics(delta: float) -> State:
	return null
	
func check_input(event: InputEvent) -> State:
	return null

func check_frame(delta: float) -> State:
	return null
