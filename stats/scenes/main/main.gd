extends Node

@onready var player_manager: PlayerManager = $PlayerManager
@onready var inventory_interface: Control = $UI/InventoryInterface

func _ready() -> void:
	#inventory_interface.set_player_inventory_data(player_manager.inventory_data)
	for inventory_data in player_manager.arr_inv :
		if inventory_data != null:
			inventory_interface.set_player_inventory_data(inventory_data)
