extends Resource
class_name InventoryData


@export var slot_datas: Array[SlotData]

signal inventory_interact(inventory_data: InventoryData, index: int, button: int)
signal inventory_updated(inventory_data: InventoryData)

func grab_slot_data(index: int) -> SlotData:
	var slot_data = slot_datas[index]
	
	if slot_data:
		slot_datas[index] = null
		inventory_updated.emit(self)
		return slot_data
	else:
		return null
func drop_slot_data(grabbed_slot_data: SlotData, index: int) -> SlotData:
	var slot_data = slot_datas[index]
	
	slot_datas[index] = grabbed_slot_data
	inventory_updated.emit(self)
	return slot_data
		
func on_slot_clicked(index: int, button: int) -> void:
	inventory_interact.emit(self, index, button)
	print("inventory interact")
