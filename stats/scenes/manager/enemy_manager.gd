extends Node
class_name EnemyManager

@export var basic_enemy_scene_1: PackedScene
@export var basic_enemy_scene_2: PackedScene
@export var basic_enemy_scene_3: PackedScene
@export var basic_enemy_scene_4: PackedScene

@onready var position_component : PositionComponent = $PositionComponent as PositionComponent
@onready var respawn_timer: Timer
@onready var enemies_arr = []

signal sig_enemy_spawn(i, enemy_new)

func _ready():
	
	enemies_arr.append(basic_enemy_scene_1)
	enemies_arr.append(basic_enemy_scene_2)
	enemies_arr.append(basic_enemy_scene_3)
	enemies_arr.append(basic_enemy_scene_4)
	
	position_component.all_enemies_died.connect(on_all_died)
	sig_enemy_spawn.connect(position_component.on_spawned)
	SignalEvents.check_if_enemy_exist.connect(on_check_if_enemy_exist)
	start_respawn_timer(2)

func on_check_if_enemy_exist():
	var enemy: CharacterBody2D = position_component.check_if_exist()
	print("enemy in position = ", enemy)
	if enemy != null:
		print("emit check = ", enemy)
		SignalEvents.return_check_if_enemy_exist.emit(enemy)
		print("emit check = returned", enemy)
	else:
		SignalEvents.return_check_if_enemy_exist.emit(null)
		print("emit check else = null")
		

func on_all_died():
	print("all die restart timer")
	start_respawn_timer(2)

func start_respawn_timer(wait_amount):
	respawn_timer = Timer.new()
	add_child(respawn_timer)
	respawn_timer.name = "RespawnTimer"
	respawn_timer.timeout.connect(on_respawn_timer_finish)
	respawn_timer.wait_time = wait_amount
	respawn_timer.start()
	
func on_respawn_timer_finish():
	if respawn_timer != null:
		respawn_timer.queue_free()
		print("spawn enemy call ")
		spawn_enemy()



func spawn_enemy():
	var i: int = 0
	for mark in position_component.get_children():
		if position_component.unit_position[i] == null and mark is Marker2D:
			
			# spawn enemy
			if enemies_arr[i] != null:
				var enemy_new = enemies_arr[i].instantiate() as Node2D
				#var sprite = enemy_new.get_node("EnemySprite")
				#sprite.frame = randi() % ENEMY_MAX_FRAMES
				
				enemy_new.global_position = mark.global_position
				#var sprite: Sprite2D = enemy_new.get_node("Sprite2D")
				#sprite.flip_h = true
				#sprite.flip_v = false
				$EnemyPlaceHolder.add_child(enemy_new)
				
				
				# connect die with collable
				var health_component: HealthComponent = enemy_new.get_node("HealthComponent")
				#var position_died_collable = Callable(position_component, "on_died")
				#position_died_collable = position_died_collable.bind(enemy_new)
				#health_component.died.connect(position_died_collable)
				print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
				print("enemy_new.bind = ", enemy_new)
				health_component.died.connect(position_component.on_died.bind(enemy_new))
				enemy_new.setTeam("Enemy")
				
				
				#sig_enemy_spawn emits
				print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
				print("sig enemy spawn emitted i = ", i, "enemy new = ", enemy_new)
				sig_enemy_spawn.emit(i, enemy_new)
				#GameEvents.enemy_spawn.emit(self)
				#GameEvents.emit_signal("enemy_spawn", self)
				SignalEvents.enemy_spawn.emit(enemy_new)
		i += 1
