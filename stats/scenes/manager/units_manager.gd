extends Node2D

class_name UnitsManager

signal unit_attack

@onready var enemy_manager: EnemyManager = $EnemyManager

func _ready() -> void:
	
