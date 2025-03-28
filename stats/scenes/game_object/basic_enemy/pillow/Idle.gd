extends State

class_name  PillowIdle

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var pillow: CharacterBody2D = $"../.."

func Enter():
	print("pillow enter idle = ", pillow.team)
	animation_player.play("idle")
	print("pillow = ;", pillow, "owner = ", owner)
	is_enemy_exist()
	print("sent is_enemy_exist() | in Pillow")
	

func Leave(i, j):
	Transitioned.emit(self, j)


func on_enemy_spawn(enemy):
	print("enemy in pillow = ", enemy)
	if enemy != null:
		if enemy.team != owner.team:
			print("in if enemy.team = ", enemy.team, "owner.team = ", owner.team)
			Leave(self, "attack")
			
func on_player_spawn(player):
	print("player in pillow = ", player)
	if player != null:
		if player.team != owner.team:
			print("in if player.team = ", player.team, "owner.team = ", owner.team)
			Leave(self, "attack")
			
func is_enemy_exist():
	print("owner.team in cheeck pillow = ", owner.team)
	if owner.team == "Player":
		SignalEvents.check_if_enemy_exist.emit()
		print("attacing send emit else check if enemy exist | in Pillow")
	elif owner.team == "Enemy":
		SignalEvents.check_if_player_exist.emit()
		print("attacing send emit else check if player exist | in Pillow")
