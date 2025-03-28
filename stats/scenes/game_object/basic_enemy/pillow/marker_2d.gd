extends Marker2D

@export var dmg_node: PackedScene

func popup(dmg_amount: int):
	var dmg = dmg_node.instantiate()
	dmg.position = global_position
	dmg.text = str(dmg_amount)
	
	get_tree().current_scene.add_child(dmg)
