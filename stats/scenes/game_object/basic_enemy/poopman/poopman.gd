extends UnitTemplate


@onready var poop_man_idle: PoopManIdle = $StateMachine2/PoopManIdle
@onready var poop_man_attack: PoopManAttack = $StateMachine2/PoopManAttack


func initSignalEvents() -> void:
	SignalEvents.connect("enemy_spawn", poop_man_idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(poop_man_idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(poop_man_attack.on_enemy_spawn)
	SignalEvents.return_check_if_player_exist.connect(poop_man_idle.on_player_spawn)
	SignalEvents.return_check_if_player_exist.connect(poop_man_attack.on_player_spawn)
	SignalEvents.all_enemies_died.connect(poop_man_attack.on_all_enemies_die)
