extends StateInterface

class_name DashState
@export var Dash_Speed : float = 800.0
@export var dash_timer : float = 0.8
var timer : float 
func enter()->void:
	pass


func physics_process(delta:float)->void:
	var player= statemachine.player_ref
	player.velocity.x=statemachine.last_dir*Dash_Speed
	
	timer=dash_timer

	print("Start")
	if timer >= 0.0:
		print(timer)
		#statemachine.change_state("idle")
	else:
		print("Timer ran out")
		
	timer = timer - delta
	print("End")

	
