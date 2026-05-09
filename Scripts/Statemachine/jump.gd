extends StateInterface

class_name JumpState
var store_velocity : float
@export var Jump_Height : float = -600.0
func enter()->void:
	var player=statemachine.player_ref
	player.velocity.y = Jump_Height

func physics_process(delta:float)->void:
	var player = statemachine.player_ref
	var direction=Input.get_axis("ui_left","ui_right")
	store_velocity = player.velocity.x
	
	if !player.is_on_floor():
		player.velocity.y += delta * 980
	
	if player.is_on_floor():
		if direction!=0:
			statemachine.change_state("move")
		else:
			statemachine.change_state("idle")
			print("velocity after on-floor:",player.velocity.x)

func handle_input(event:InputEvent)->void:
	#var player=statemachine.get_parent()
	pass
	
