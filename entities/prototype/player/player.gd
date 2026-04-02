extends CharacterBody2D

@onready var state_machine:= $StateMachine
@onready var sprite: Sprite2D = $Sprite2D

var jump_available := true # on floor/coyote time
var jump_buffer := false # jump buffer
@export var coyote_time: float
@export var jump_buffer_time: float
var coyote_jump:= false

var momentum_x: float
var momentum_y: float


func _ready() -> void:
	state_machine.start_state_machine(self)
	Engine.time_scale = 0.15

func _physics_process(_delta: float) -> void:
	# Maintains momentum I think
	velocity = Vector2(momentum_x, momentum_y)
	move_and_slide()
	
	#print(velocity)
	
	# Conditions for jumping
	
	if not is_on_floor():
		if jump_available:
			coyote_jump = true
			get_tree().create_timer(coyote_time).timeout.connect(_on_coyote_timeout)
			
		if Input.is_action_just_pressed("jump"):
			jump_buffer = true
			await get_tree().create_timer(jump_buffer_time).timeout
			jump_buffer = false
	else:
		jump_available = true
	
	
	
	
func _on_coyote_timeout():
	print("coyote timeout")
	print(coyote_jump)
	jump_available = false
	coyote_jump = false
