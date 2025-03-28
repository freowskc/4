extends Node

class_name PositionComponent


# Array to keep track of enemy data: [enemy, 0, 0, 0]
@onready var unit_position = [null, null, null, null] #position 1, 2, 3, 4
@onready var position_on_mark = [2, 4, 1, 3] #position on mark
@onready var is_all_died : bool

signal all_enemies_died


func on_spawned(i, enemy):
	unit_position[i] = enemy
	print("unit_pos = ", unit_position, "unit[0] = ", unit_position[0])
	print("Spawned enemy at index", i, ". Current markers:", unit_position)
	
	
func on_died(dying_enemy):
	var pos = get_index_position(dying_enemy)
	print('pos = ', pos)
	print("dying enemy = ", dying_enemy)
	print("unit[pos] = ", unit_position[pos])
	if pos != null:
		unit_position[pos] = null
	print("enemy at index ", pos, " died", unit_position)
	
	#check if all die
	if check_is_all_died():
		all_enemies_died.emit()
		#GameEvents.enemy_die_all.emit(self)
		print("emiting all_enemies_died")
		SignalEvents.all_enemies_died.emit()


func check_is_all_died():
	var flag = true
	for i in unit_position:
		if i != null:
			flag = false
			return flag
	return flag
	
func check_if_exist():
	for enemy in unit_position:
		print("unit_pos in check =", unit_position, "unit[0] = ", unit_position[0])
		print("unit_pos enemy in positionocmp = ", enemy, " type = ", type_string(typeof(enemy)))
		if enemy != null:
			print("enemy in positionocmp in if = ", enemy)
			return enemy
	return null
	
func get_index_position(unit):
	for i in range(len(unit_position)):
		if unit_position[i] == unit:
			return i
	return null
				
func get_position_on_mark(real_position: int):
	if real_position == 1:
		return 2
	if real_position == 2:
		return 4
	if real_position == 3:
		return 1
	if real_position == 4:
		return 3
	
func get_object_from_real_position(position: int):
	return unit_position[position]
