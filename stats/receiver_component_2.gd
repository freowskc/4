extends Node
class_name ReceiverComponent2

@export var state_machine_component: Node
@export var state: Node
@export var health_component: HealthComponent
@export var damage_popup: PackedScene
@export var damage_popup2: PackedScene

func _ready() -> void:
	SignalEvents.unit_attack.connect(on_unit_attack)


func on_unit_attack(dmg, target):
	if target == owner :
		var dmg_final = max(1, dmg[0] - owner.defense)
		health_component.damage(dmg_final)
		print("dmg = ", dmg[0], "owner.defense = ", owner.defense, "dmg - defense = ", dmg[0]-owner.defense, " max = ", dmg_final)
		state_machine_component.on_child_transition(state_machine_component.current_state, state.state_type)
		#damage number (new pop up)
		if damage_popup2 != null:
			var damage_number = damage_popup2.instantiate()
			get_tree().current_scene.add_child(damage_number)
			damage_number.position = owner.global_position  # Position at the character's current position
			damage_number.show_damage(dmg, "verotical")
		#damage popup
		if damage_popup != null:
			var damage_instance = damage_popup.instantiate()
			damage_instance.position = owner.global_position
			damage_instance.popup(dmg_final)
			get_tree().current_scene.add_child(damage_instance)
			
		
		
		
		
		
