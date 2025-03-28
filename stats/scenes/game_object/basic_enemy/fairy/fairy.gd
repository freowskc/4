extends UnitTemplate

@onready var fairy_idle: FairyIdle = $StateMachine2/FairyIdle
@onready var fairy_attack: FairyAttack = $StateMachine2/FairyAttack

func initSignalEvents() -> void:
	SignalEvents.connect("enemy_spawn", fairy_idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(fairy_idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(fairy_attack.on_enemy_spawn)
	SignalEvents.return_check_if_player_exist.connect(fairy_idle.on_player_spawn)
	SignalEvents.return_check_if_player_exist.connect(fairy_attack.on_player_spawn)
	SignalEvents.all_enemies_died.connect(fairy_attack.on_all_enemies_die)
