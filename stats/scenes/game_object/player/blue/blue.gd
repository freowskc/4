extends UnitTemplate

@onready var blue_walk: BlueWalk = $StateMachine2/BlueWalk
@onready var blue_attack: BlueAttack = $StateMachine2/BlueAttack


func initSignalEvents() -> void:
	SignalEvents.connect("enemy_spawn", blue_walk.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(blue_walk.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(blue_attack.on_enemy_spawn)
	SignalEvents.return_check_if_player_exist.connect(blue_walk.on_player_spawn)
	SignalEvents.return_check_if_player_exist.connect(blue_attack.on_player_spawn)
	SignalEvents.all_enemies_died.connect(blue_attack.on_all_enemies_die)
