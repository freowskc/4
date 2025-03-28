extends Node

class_name PlayerManager


@export var basic_player_scene_1: PackedScene
@export var basic_player_scene_2: PackedScene
@export var basic_player_scene_3: PackedScene
@export var basic_player_scene_4: PackedScene

@export var inventory_data_1: InventoryData
@export var inventory_data_2: InventoryData
@export var inventory_data_3: InventoryData
@export var inventory_data_4: InventoryData

@onready var position_component : PositionComponent = $PositionComponent as PositionComponent
@onready var arr_temp = []
@onready var arr_inv = []


signal sig_enemy_spawn

func _ready():
	arr_temp.append(basic_player_scene_1)
	arr_temp.append(basic_player_scene_2)
	arr_temp.append(basic_player_scene_3)
	arr_temp.append(basic_player_scene_4)
	
	arr_inv.append(inventory_data_1)
	arr_inv.append(inventory_data_2)
	arr_inv.append(inventory_data_3)
	arr_inv.append(inventory_data_4)
	
	
	spawn_player()
	#sig_enemy_spawn.connect(position_component.on_spawned)
	SignalEvents.check_if_player_exist.connect(on_check_if_player_exist)

func on_check_if_player_exist():
	var player: CharacterBody2D = position_component.check_if_exist()
	print("player in position = ", player)
	if player != null:
		print("emit check = ", player)
		SignalEvents.return_check_if_player_exist.emit(player)
		print("emit check = returned", player)
	else:
		SignalEvents.return_check_if_player_exist.emit(null)
		print("emit check else = null")

func spawn_player():
	var i: int = 0
	for mark in position_component.get_children():
		if position_component.unit_position[i] == null and mark is Marker2D:
			
			# spawn player
			if not arr_temp[i]:
				i += 1
				continue
			var player_new = arr_temp[i].instantiate() as Node2D
			position_component.unit_position[i] = player_new
			#var sprite = player_new.get_node("EnemySprite")
			#sprite.frame = randi() % ENEMY_MAX_FRAMES
			
			player_new.global_position = mark.global_position
			#var sprite: Sprite2D = player_new.get_node("Sprite2D")
			#sprite.flip_h = false
			#sprite.flip_v = false
			$PlayerPlaceHolder.add_child(player_new)
			
			
			# connect die with collable
			var health_component: HealthComponent = player_new.get_node("HealthComponent")
			player_new.setTeam("Player")
			print("setted team ", player_new.team)
			print("setted team player = ", player_new)
			##var position_died_collable = Callable(position_component, "on_died")
			##position_died_collable = position_died_collable.bind(player_new)
			#health_component.died.connect(on_died)
			##health_component.died.connect(position_died_collable)
			health_component.died.connect(position_component.on_died.bind(player_new))
			
			
			#sig_enemy_spawn emits
			#sig_enemy_spawn.emit(i, player_new)
			#GameEvents.enemy_spawn.emit(self)
			#GameEvents.emit_signal("enemy_spawn", self)
			#SignalEvents.emit_game_signal("enemy_spawn", self)
		i += 1
