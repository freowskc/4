extends UnitTemplate

@onready var rogue_idle: Rogue1Idle = $StateMachine2/RogueIdle
@onready var rogue_attack: Node = $StateMachine2/RogueAttack


func initSignalEvents() -> void:
	SignalEvents.connect("enemy_spawn", rogue_idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(rogue_idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(rogue_attack.on_enemy_spawn)
	SignalEvents.return_check_if_player_exist.connect(rogue_idle.on_player_spawn)
	SignalEvents.return_check_if_player_exist.connect(rogue_attack.on_player_spawn)
	SignalEvents.all_enemies_died.connect(rogue_attack.on_all_enemies_die)
