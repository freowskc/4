extends Node
class_name ReceiverComponent

@export var state_machine_component: Node
@export var state: Node
@export var health_component: HealthComponent
@export var damage_popup: PackedScene


func _ready() -> void:
	SignalEvents.unit_attack.connect(on_unit_attack)


func on_unit_attack(dmg, target):
	var dmg_final = max(1, dmg - owner.defense)
	if target == owner :
		health_component.damage(dmg_final)
		print("dmg = ", dmg, "owner.defense = ", owner.defense, "dmg - defense = ", dmg-owner.defense, " max = ", dmg_final)
		state_machine_component.on_child_transition(state_machine_component.current_state, state.state_type)
		#damage popup
		if damage_popup != null:
			var damage_instance = damage_popup.instantiate()
			damage_instance.position = owner.global_position
			damage_instance.popup(dmg_final)
			get_tree().current_scene.add_child(damage_instance)
		
		
		
		
