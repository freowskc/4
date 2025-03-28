extends Resource

class_name PartResource

enum part_types {
	SIGNAL,
	ON_STATE,
	TO_STATE,
	COMB_SIG_ON,
	COMB_SIG_TO,
	COMB_ON_TO,
	FULL_PART
}

@export var icon: Texture
@export var type: part_types
@export var signal_name: String = "-"
@export var on_state: String = "-"
@export var to_state: String = "-" 
#@export var state: String = "-" : set = set_state
@export_multiline var description: String  = "-"


#func set_state(state_value: String) -> void:
	#print("State_value = ", state_value)
	#if type == part_types.ON_STATE:
		#on_state = state_value
		#print("set String on State data: ", on_state)
	#
		#
	#elif type == part_types.TO_STATE:
		#to_state = state_value
		#print("set String to State data: ", to_state)
