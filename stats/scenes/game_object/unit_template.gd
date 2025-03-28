extends CharacterBody2D
class_name UnitTemplate

@export var stat: PriestStat


var team: String = ""
var attack: float
var defense: float
var health: float
var attack_speed: float
var crit_chance: float
var crit_multiplier: float
# Create a RandomNumberGenerator instance
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()  # Initialize the random number generator
	initSignalEvents()
	setStat(stat)
	
func initSignalEvents() -> void:
	pass
	
func setTeam(teamonspawn: String) -> void:
	team = teamonspawn
	
func setStat(stat: Resource) -> void:
	print("owner = = ", owner)
	attack = stat.attack
	defense = stat.defense
	health = stat.health
	attack_speed = stat.attack_speed  # Assuming `attack_speed` is defined in your `stat` resource
	crit_chance = stat.crit_chance
	crit_multiplier = stat.crit_multiplier
	
# Function to calculate damage including critical hits
func calculate_damage() -> Array:
	var is_crit = rng.randf() < crit_chance
	var damage = attack  # Base attack value
	if is_crit:
		damage *= crit_multiplier
	print("returning damage[0] = ", damage, "damage[1] = ", is_crit)
	return [damage, is_crit]
