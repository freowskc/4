extends Node


signal fully_merge_parts
signal check_if_enemy_exist
signal return_check_if_enemy_exist(enemy)
signal check_if_player_exist
signal return_check_if_player_exist(player)
signal all_enemies_died
signal unit_attack(dmg: Array, enemy)
signal enemy_spawn(enemy)
@export var signal_lists_resource : SignalTemp


#signal enemy_die
#signal enemy_die_all

#signal char_timer
#signal char_idle_enter
#signal char_idle_exit
#signal char_attack_enter
#signal char_attack_exit
#signal char_crit_enter
#signal char_crit_exit
#signal char_wander_enter
#signal char_wander_exit

 # Create a signal for each action
func _ready() -> void:
	print("signal_lists_resource = ", signal_lists_resource)
	print("signal_lists_resource.signals = ", signal_lists_resource.signals)
	
	for action_signal in signal_lists_resource.signals:
		add_user_signal(action_signal)
		#print("created signal : ", action_signal)

func emit_game_signal(signal_name, data = null):
	if has_signal(signal_name):
		emit_signal(signal_name, data)
	else:
		push_error("Attempted to emit undefined signal: '%s'" % signal_name, " , data : ", data)
