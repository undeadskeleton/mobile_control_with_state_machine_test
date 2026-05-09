extends StateInterface

class_name DashState
@export var Dash_Speed : float = 800.0
@export var dash_timer : float = 0.8
var timer : float 
func enter()->void:
	timer=dash_timer


func physics_process(delta:float)->void:
	var player= statemachine.player_ref
	player.velocity.x=statemachine.last_dir*Dash_Speed
	
	if timer <= 0.0:
		statemachine.change_state("idle")
	timer -= delta

	
