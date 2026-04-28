extends Node

class_name StateMachine

var states : Dictionary ={}
@export var initialstate : StateInterface
var currentstate: StateInterface
var currentstatename : String
@export var player_ref : CharacterBody2D

func _ready() -> void:
	for child in get_children():
		if child is StateInterface:
			states[child.name.to_lower()]=child
			child.statemachine=self
	
	if initialstate:
		change_state(initialstate.name)	
	

func change_state(new_state_name)->void:
	if currentstate:
		currentstate.exit()
	
	currentstatename=new_state_name
	currentstate=states.get(new_state_name.to_lower())
	
	if currentstate:
		currentstate.enter()
	else:
		push_error("State Not found: ",currentstatename)

func _physics_process(delta: float) -> void:
	if currentstate:
		currentstate.physics_process(delta)
		
func _process(delta: float) -> void:
	if currentstate:
		currentstate.process(delta)

func _input(event: InputEvent) -> void:
	if currentstate:
		currentstate.handle_input(event)

func getcurrentstatename()->String:
	return currentstatename
	
