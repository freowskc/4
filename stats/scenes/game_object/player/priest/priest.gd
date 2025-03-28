extends UnitTemplate

@onready var priest_walk: PriestWalk = $StateMachine2/PriestWalk
@onready var priest_attack: PriestAttack = $StateMachine2/PriestAttack


func initSignalEvents() -> void:
	SignalEvents.connect("enemy_spawn", priest_walk.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(priest_walk.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(priest_attack.on_enemy_spawn)
	SignalEvents.return_check_if_player_exist.connect(priest_walk.on_player_spawn)
	SignalEvents.return_check_if_player_exist.connect(priest_attack.on_player_spawn)
	SignalEvents.all_enemies_died.connect(priest_attack.on_all_enemies_die)
