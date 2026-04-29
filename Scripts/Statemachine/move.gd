extends StateInterface

class_name MoveState

@export var Move_Speed : float = 479.45

func physics_process(delta:float)->void:
	var player=statemachine.player_ref
	
	if !player.is_on_floor():
		player.velocity.y+= 980* delta
	
	var direction=Input.get_axis("ui_left","ui_right")
	
	if direction==0:
		statemachine.change_state("idle")
	#else:
	
	player.velocity.x = direction * Move_Speed

func handle_input(event:InputEvent)->void:
	if Input.is_action_just_pressed("ui_accept"):
		statemachine.change_state("jump")
