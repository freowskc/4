extends Node

class_name StateMachine

@export var initial_state : State
@onready var current_state : State
@onready var states : Dictionary = {}


func _ready():

	#initialize static premade state
	for child in get_children():
		if child is State:
			states[child.state_type.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			#child.check_dynamic_transitions.connect(on_check_dynamic_transitions)
			print("state inserting to states dict " + child.state_type)
	print("states = ", states)
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
		print("entering initial state from fsm node and assign to current_state")
		

func is_state_exist(state_type: String) -> bool:
	var type_key : String = state_type.to_lower()
	if not type_key in states:
		print("state havn't been in states yet = ", type_key)
		print("states = ", states)
		return false
	else :
		print("state already exist = ", type_key)
		print("states = ", states)
		return true
			
func on_fully_merged(full_part: SlotResource):
	print("----------------------- set up dynamic conneciton -----------------------")
	print("on on_fully_merge full part's type = ", full_part.part_data.type)
	if is_state_exist(full_part.part_data.on_state) and is_state_exist(full_part.part_data.to_state):
		var signal_name : String = full_part.part_data.signal_name
		var receiver : State = is_state_from_dynamic_part_exist(full_part.part_data.on_state)
		var to_state : String = full_part.part_data.to_state
		SignalEvents.connect(signal_name, receiver.Leave.bind(to_state))
		print("connected ", full_part.part_data.type, " ,signal = ", full_part.part_data.signal_name, " ,on = ", full_part.part_data.on_state, " , to = ", full_part.part_data.to_state)
	

func is_state_from_dynamic_part_exist(state_type_check: String) -> State:
	for child in get_children():
		if child is State and (child.state_type.to_lower() == state_type_check):
			return child
	return null
	
func on_child_transition(state, new_state_name):
	print("Transitioning from ", state.state_type, " to ", new_state_name)
	if state != current_state:
		print("state != current_state | if state != current_state")
		print("state = ", state, ", current_state = ", current_state)
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if not new_state:
		print("no new state found returning")
		return
	if current_state:
		current_state.Exit()
		print("==================== exitted ", current_state.state_type, " state =====================")
		print("current state exited = ", current_state, " | if current_state")
	
	print("==================== entering ", new_state_name, " state =====================")
	current_state = new_state
	new_state.Enter()
		

func _process(delta):
	if current_state:
		current_state.Update(delta)
		
func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)
		
