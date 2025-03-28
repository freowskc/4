extends Control

class_name InventoryInterface
var grabbed_slot_data: SlotResource

@onready var grabbed_slot: PanelContainer = $GrabbedSlot

func _physics_process(delta: float) -> void:
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position()

func on_inventory_interact(inventory_data: InventoryResource,
		index: int, button: int) -> void:
	match [grabbed_slot_data, button]:
		
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.grab_slot_data(index)
		[_, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.drop_slot_data(grabbed_slot_data, index)
			
	update_grabbed_slot()

func update_grabbed_slot() -> void:
	if grabbed_slot_data:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbed_slot_data)
	else:
		grabbed_slot.hide()
		
