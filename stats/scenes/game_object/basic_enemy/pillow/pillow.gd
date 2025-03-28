extends CharacterBody2D

@export var stat: PriestStat
@onready var attackk: PillowAttack = $StateMachineComponent/Attack
@onready var idle: PillowIdle = $StateMachineComponent/Idle

var team: String = ""
var attack: int
var defense: int
var health: int

func _ready() -> void:
	#SignalEvents.enemy_spawn.connect(idle.on_enemy_spawn)
	SignalEvents.connect("enemy_spawn", idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(idle.on_enemy_spawn)
	SignalEvents.return_check_if_enemy_exist.connect(attackk.on_enemy_spawn)
	SignalEvents.return_check_if_player_exist.connect(idle.on_player_spawn)
	SignalEvents.return_check_if_player_exist.connect(attackk.on_player_spawn)
	SignalEvents.all_enemies_died.connect(attackk.on_all_enemies_die)
	setStat(stat)
	
func setTeam(teamonspawn: String) -> void:
	team = teamonspawn

func setStat(stat: Resource) -> void:
	attack = stat.attack
	defense = stat.defense
	health = stat.health
