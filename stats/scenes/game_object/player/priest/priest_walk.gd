extends State

class_name  PriestWalk

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func Enter():
	animation_player.play("walking")
	print("priest enter walk")
	is_enemy_exist()
	

func Leave(i, j):
	Transitioned.emit(self, j)


func on_enemy_spawn(enemy):
	print("enemy in priest = ", enemy)
	if enemy != null:
		if enemy.team != owner.team:
			print("priest leaving walk")
			Leave(self, "priestattack")
			
func on_player_spawn(player):
	print("player in priest = ", player)
	if player != null:
		if player.team != owner.team:
			print("priest leaving walk")
			Leave(self, "priestattack")

func is_enemy_exist():
	print("owner.team in cheeck = ", owner.team)
	if owner.team == "Player":
		SignalEvents.check_if_enemy_exist.emit()
		print("attacing send emit else check if enemy exist | in priest")
	elif owner.team == "Enemy":
		SignalEvents.check_if_player_exist.emit()
		print("attacing send emit else check if player exist | in priest")
