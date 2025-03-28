extends CharacterBody2D

class_name Player

@export var speed = 100
@export var gravity = 30
@export var jump_force = 300

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var rogue_idle = $"StateMachine/RogueIdle"
@onready var rogue_attack = $"StateMachine/RogueAttack"
@onready var anim_ryu_sprite : Node2D = %AnimRyuComponent/Sprite2D
@onready var state_machine: StateMachine = $StateMachine
var team: String = ""
var attack: int
var defense: int
var health: int


func _ready():
	SignalEvents.connect("fully_merge_parts", state_machine.on_fully_merged)
	SignalEvents.connect("enemy_spawn", rogue_idle.Leave.bind("rogue_attack"))
	SignalEvents.connect("enemy_die_all", rogue_attack.Leave.bind("rogue_idle"))

#func _physics_process(delta: float) -> void:
	#move_and_slide()
	#if !is_on_floor():
		#velocity.y += gravity
		#if velocity.y >= 1000:
			#velocity.y = 1000
	#if velocity.x > 0:
		#anim_ryu_sprite.scale.x = 1
	#elif velocity.x < 0:
		#anim_ryu_sprite.scale.x = -1
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x > 0:
		anim_ryu_sprite.scale.x = 1
	elif velocity.x < 0:
		anim_ryu_sprite.scale.x = -1

	move_and_slide()
	
func setTeam(teamonspawn: String) -> void:
	team = teamonspawn
	
func setStat(stat: Resource) -> void:
	attack = stat.attack
	defense = stat.defense
	health = stat.health

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("gengger_chasing_area"):
		state_machine.on_child_transition(state_machine.current_state, "rogue_get_damage")
		
