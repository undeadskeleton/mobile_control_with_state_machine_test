extends StateInterface

class_name MoveState

@export var Move_Speed : float = 479.45
var states_last_dir : int 
func physics_process(delta:float)->void:
	var player=statemachine.player_ref
	
	if !player.is_on_floor():
		player.velocity.y+= 980* delta
	
	var direction=Input.get_axis("ui_left","ui_right")
	states_last_dir=direction
	if direction==0:
		statemachine.last_dir = states_last_dir
		statemachine.change_state("idle")
	
	player.velocity.x = direction * Move_Speed

func handle_input(event:InputEvent)->void:
	if Input.is_action_just_pressed("ui_accept"):
		statemachine.change_state("jump")
	if Input.is_action_just_pressed("Dash"):
		statemachine.change_state("dash")
