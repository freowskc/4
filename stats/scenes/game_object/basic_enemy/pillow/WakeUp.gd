extends State

class_name  PillowWakeUp

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func Enter():
	animation_player.play("wake_up")
	await animation_player.animation_finished
	Leave(self, "idle")


func Leave(i, j):
	Transitioned.emit(self, j)
