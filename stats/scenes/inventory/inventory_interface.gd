extends Control

var grabbed_slot_data: SlotData
@onready var grabbed_slot: PanelContainer = $GrabbedSlot

@onready var player_inventory: PanelContainer = $GridContainer/PlayerInventory
@onready var player_inventory_2: PanelContainer = $GridContainer/PlayerInventory2
@onready var player_inventory_3: PanelContainer = $GridContainer/PlayerInventory3
@onready var player_inventory_4: PanelContainer = $GridContainer/PlayerInventory4

@onready var arr_temp = []
@onready var i = 0

func _ready() -> void:
	arr_temp.append(player_inventory)
	arr_temp.append(player_inventory_2)
	arr_temp.append(player_inventory_3)
	arr_temp.append(player_inventory_4)
	
func _physics_process(delta: float) -> void:
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5, 5)
		
func set_player_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(on_inventory_interact)
	arr_temp[i].set_inventory_data(inventory_data)
	i += 1

func on_inventory_interact(inventory_data: InventoryData,
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
