extends CharacterBody2D

class_name Test

@export var speed = 100
@export var gravity = 30
@export var jump_force = 300

@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	#move_and_slide()
	if !is_on_floor() and velocity.y > 0:
		velocity.y += gravity
	if velocity.x > 0:
		sprite_2d.scale.x = 1
	elif velocity.x < 0:
		sprite_2d.scale.x = -1
