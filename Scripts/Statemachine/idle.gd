extends StateInterface

class_name IdleState

func enter()->void:
	var player=statemachine.player_ref
	player.velocity.x = 0
	print("The last dir: ",statemachine.last_dir)

func physics_process(delta:float)->void:
	var player=statemachine.player_ref
	if !player.is_on_floor():
		player.velocity.y += 980 * delta

func handle_input(event:InputEvent)->void:
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		statemachine.change_state("move")
	if Input.is_action_just_pressed("ui_accept"):
		statemachine.change_state("jump")
	if Input.is_action_just_pressed("Dash"):
		statemachine.change_state("dash")
					
