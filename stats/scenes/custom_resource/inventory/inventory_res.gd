extends Resource

class_name InventoryResource
 
signal inventory_interact(inventory_data: InventoryResource, index: int, button: int)
signal inventory_updated(inventory_data: InventoryResource)

@export var slot_reses: Array[SlotResource]

func grab_slot_data(index: int) -> SlotResource:
	var slot_data = slot_reses[index]
	
	if slot_data:
		slot_reses[index] = null
		inventory_updated.emit(self)
		return slot_data
	else:
		return null
		
func drop_slot_data(grabbed_slot_data: SlotResource, index: int) -> SlotResource:
	var slot_data = slot_reses[index]
	
	var return_slot_data: SlotResource
	if slot_data:
		var flag_arr: Array[bool] = slot_data.fully_merge_with(grabbed_slot_data)
		print("flag_bool = ", flag_arr[0], "flag_just_combined = ", flag_arr[1])
		# if full_part and just combined
		if flag_arr[1]:
			print("flag_enter if full_part and just combined")
			SignalEvents.fully_merge_parts.emit(slot_data)
			print("emitted fully merge")
			
		# if call fully_merge_with but don't merged
		if not flag_arr[0]:
			print("flag_enter if call fully_merge_with but don't merged")
			print("flag type = ", grabbed_slot_data.part_data.type)
			return_slot_data = grabbed_slot_data
	else:
		slot_reses[index] = grabbed_slot_data
		return_slot_data = slot_data
	
	inventory_updated.emit(self)
	print("return slot data = ", return_slot_data)
	return return_slot_data
		
func on_slot_clicked(index: int, button: int) -> void:
	inventory_interact.emit(self, index, button)

