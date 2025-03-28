extends UnitTemplate

@onready var pigman_walk: PigmanWalk = $StateMachine2/PigmanWalk
@onready var pigman_attack: Node = $StateMachine2/PigmanAttack

func initSignalEvents() -> void:
	SignalEvents.connect("enemy_spawn", pigman_walk.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(pigman_walk.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(pigman_attack.on_enemy_spawn)
	SignalEvents.return_check_if_player_exist.connect(pigman_walk.on_player_spawn)
	SignalEvents.return_check_if_player_exist.connect(pigman_attack.on_player_spawn)
	SignalEvents.all_enemies_died.connect(pigman_attack.on_all_enemies_die)
