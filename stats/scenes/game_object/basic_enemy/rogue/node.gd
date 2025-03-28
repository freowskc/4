extends State

class_name  Rogue1Idle

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func Enter():
	animation_player.play("idle")
	is_enemy_exist()
	

func Leave(i, j):
	Transitioned.emit(self, j)


func on_enemy_spawn(enemy):
	print("enemy in priest = ", enemy)
	if enemy != null:
		if enemy.team != owner.team:
			print("priest leaving walk")
			Leave(self, "charge")
			
func on_player_spawn(player):
	print("player in priest = ", player)
	if player != null:
		if player.team != owner.team:
			print("priest leaving walk")
			Leave(self, "charge")

func is_enemy_exist():
	print("owner.team in cheeck = ", owner.team)
	if owner.team == "Player":
		SignalEvents.check_if_enemy_exist.emit()
		print("FAIRY attacing send emit else check if enemy exist | in FAIRY")
	elif owner.team == "Enemy":
		SignalEvents.check_if_player_exist.emit()
		print("FAIRY attacing send emit else check if player exist | in FAIRY")
