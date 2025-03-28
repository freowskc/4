extends CharacterBody2D

class_name BaseUnit

@export var speed = 50
@export var gravity = 30
@export var jump_force = 300

#@export var rogue_idle = State
#@onready var rogue_attack = State
#@onready var anim_ryu_sprite : Node2D = %AnimRyuComponent/Sprite2D
@onready var wander: GengGerWander = $StateMachineComponent/wander
@onready var state_machine_component: StateMachine2 = $StateMachineComponent




func _ready():
	SignalEvents.connect("fully_merge_parts", state_machine_component.on_fully_merged)
	SignalEvents
	#SignalEvents.connect("enemy_spawn", rogue_idle.Leave.bind("rogue_attack"))
	#SignalEvents.connect("enemy_die_all", rogue_attack.Leave.bind("rogue_idle"))

func _physics_process(delta: float) -> void:
	pass
	#move_and_slide()
	#if !is_on_floor():
		#velocity.y += gravity
		#if velocity.y >= 1000:
			#velocity.y = 1000
	#if velocity.x > 0:
		#anim_ryu_sprite.flip_h = false
	#elif velocity.x < 0:
		#anim_ryu_sprite.flip_h = true
	
