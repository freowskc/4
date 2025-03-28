extends Resource

class_name SlotResource
 
@export var part_data: PartResource

func fully_merge_with(other_slot_data: SlotResource) -> Array[bool]:
	var flag_bool: bool
	var flag_just_combined: bool = false
	var flag_arr: Array[bool] = []
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("merging part_data = ", part_data.type, ", other_slot_data = ", other_slot_data.part_data.type)
	# SIGNAL + ON_STATE
	if (part_data.type == part_data.part_types.SIGNAL and other_slot_data.part_data.type == part_data.part_types.ON_STATE): 
		part_data.type = part_data.part_types.COMB_SIG_ON
		part_data.on_state = other_slot_data.part_data.on_state
		flag_bool = true
		print("SIGNAL + ON_STATE")
		
		#part_data.description = part_data.description + "\n" + other_slot_data.part_data.description
	elif (part_data.type == part_data.part_types.ON_STATE and other_slot_data.part_data.type == part_data.part_types.SIGNAL):
		part_data.type = part_data.part_types.COMB_SIG_ON
		part_data.signal_name = other_slot_data.part_data.signal_name
		#part_data.description = other_slot_data.part_data.description + "\n" + part_data.description
		flag_bool = true
		print("SIGNAL + ON_STATE")
	# SIGNAl + TO_STATE	
	elif (part_data.type == part_data.part_types.SIGNAL and other_slot_data.part_data.type == part_data.part_types.TO_STATE):
		part_data.type = part_data.part_types.COMB_SIG_TO
		part_data.to_state = other_slot_data.part_data.to_state
		flag_bool = true
		print("SIGNAl + TO_STATE")
	elif (part_data.type == part_data.part_types.TO_STATE and other_slot_data.part_data.type == part_data.part_types.SIGNAL) :
		part_data.type = part_data.part_types.COMB_SIG_TO
		part_data.signal_name = other_slot_data.part_data.signal_name
		flag_bool = true
		print("SIGNAl + TO_STATE")
		
	# ON_STATE + TO_STATE
	elif (part_data.type == part_data.part_types.ON_STATE and other_slot_data.part_data.type == part_data.part_types.TO_STATE) :
		part_data.type = part_data.part_types.COMB_ON_TO
		part_data.to_state = other_slot_data.part_data.to_state
		flag_bool = true
		print("ON_STATE + TO_STATE")
	elif (part_data.type == part_data.part_types.TO_STATE and other_slot_data.part_data.type == part_data.part_types.ON_STATE) :
		part_data.type = part_data.part_types.COMB_ON_TO
		part_data.on_state = other_slot_data.part_data.on_state
		flag_bool = true
		print("ON_STATE + TO_STATE")
		
	# COMB_SIG_ON + TO_STATE	
	elif (part_data.type == part_data.part_types.COMB_SIG_ON and other_slot_data.part_data.type == part_data.part_types.TO_STATE) :
		part_data.type = part_data.part_types.FULL_PART
		part_data.to_state = other_slot_data.part_data.to_state
		flag_bool = true
		flag_just_combined = true
		print("COMB_SIG_ON + TO_STATE")
	elif (part_data.type == part_data.part_types.TO_STATE and other_slot_data.part_data.type == part_data.part_types.COMB_SIG_ON) :
		part_data.type = part_data.part_types.FULL_PART
		part_data.signal_name = other_slot_data.part_data.signal_name
		part_data.on_state = other_slot_data.part_data.on_state
		flag_bool = true
		flag_just_combined = true
		print("COMB_SIG_ON + TO_STATE")
	
	# COM_SIG_TO + ON_STATE	
	elif (part_data.type == part_data.part_types.COMB_SIG_TO and other_slot_data.part_data.type == part_data.part_types.ON_STATE) :
		part_data.type = part_data.part_types.FULL_PART
		part_data.on_state = other_slot_data.part_data.on_state
		flag_bool = true
		flag_just_combined = true
		print("COM_SIG_TO + ON_STATE")
	elif (part_data.type == part_data.part_types.ON_STATE and other_slot_data.part_data.type == part_data.part_types.COMB_SIG_TO) :
		part_data.type = part_data.part_types.FULL_PART
		part_data.signal_name = other_slot_data.part_data.signal_name
		part_data.to_state = other_slot_data.part_data.to_state
		flag_bool = true
		flag_just_combined = true
		print("COM_SIG_TO + ON_STATE")
	
	
	# COMG_ON_TO + SIGNAL
	elif (part_data.type == part_data.part_types.COMB_ON_TO and other_slot_data.part_data.type == part_data.part_types.SIGNAL) :
		part_data.type = part_data.part_types.FULL_PART
		part_data.signal_name = other_slot_data.part_data.signal_name
		flag_bool = true
		flag_just_combined = true
		print("COMG_ON_TO + SIGNAL")
	elif (part_data.type == part_data.part_types.SIGNAL and other_slot_data.part_data.type == part_data.part_types.COMB_ON_TO):
		part_data.type = part_data.part_types.FULL_PART
		part_data.on_state = other_slot_data.part_data.on_state
		part_data.to_state = other_slot_data.part_data.to_state
		flag_bool = true
		flag_just_combined = true
		print("COMG_ON_TO + SIGNAL")
		
	else:
		flag_bool = false
		print("can't merge invalid parts combination")
	
	print("part_data.type = ", part_data.type)
	print("part_data.signal_name = ", part_data.signal_name)
	print("part_data.on_state = ", part_data.on_state)
	print("part_data.to_state = ", part_data.to_state)
	print("____________________________________________")
	print("other_slot_data.part_data.type = ", other_slot_data.part_data.type)
	print("other_slot_data.part_data.signal_name = ", other_slot_data.part_data.signal_name)
	print("other_slot_data.part_data.on_state = ", other_slot_data.part_data.on_state)
	print("other_slot_data.part_data.to_state = ", other_slot_data.part_data.to_state)

	flag_arr.append(flag_bool)
	flag_arr.append(flag_just_combined)
	print("flag_bool in fully merge func = ", flag_arr[0], "flag_jsut_combined in fulluy merge func = ", flag_arr[1])
	return(flag_arr)
