extends CharacterBody2D

class_name GengGerTest

@export var speed = 50
@export var gravity = 30
@export var jump_force = 300

#@export var rogue_idle = State
#@onready var rogue_attack = State
#@onready var anim_ryu_sprite : Node2D = %AnimRyuComponent/Sprite2D
@onready var wander: GengGerWander = $StateMachineComponent/wander
@onready var state_machine_component: StateMachine2 = $StateMachineComponent
@onready var sprite_2d: Sprite2D = $Sprite2D




func _ready():
	SignalEvents.connect("fully_merge_parts", state_machine_component.on_fully_merged)
	
	#SignalEvents.connect("enemy_spawn", rogue_idle.Leave.bind("rogue_attack"))
	#SignalEvents.connect("enemy_die_all", rogue_attack.Leave.bind("rogue_idle"))

func _physics_process(delta: float) -> void:
	move_and_slide()
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y >= 1000:
			velocity.y = 1000
	if velocity.x > 0:
		sprite_2d.flip_h = false
	elif velocity.x < 0:
		sprite_2d.flip_h = true
