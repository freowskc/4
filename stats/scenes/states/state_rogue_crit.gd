extends State

class_name RogueCrit
@onready var animation = %AnimRyuComponent/AnimationPlayer

func Enter():
	animation.play("hurt")
	await  animation.animation_finished
	print("crit animation ended emitting to attack")
	Transitioned.emit(self, "rogue_attack")
	#SignalEvents.char_crit_enter.emit(self)
	SignalEvents.emit_game_signal("char_crit", self)
	
func Leave(i, j):
	#SignalEvents.char_crit_exit.emit(self)
	#SignalEvents.emit_game_signal("char_crit_exit", self)
	Transitioned.emit(self, j)
