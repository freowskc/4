extends State

class_name  RogueAttack
@onready var animation = %AnimRyuComponent/AnimationPlayer

func Enter():
	animation.play("attack")
	#SignalEvents.char_attack_enter.emit(self)
	SignalEvents.emit_game_signal("char_attack", self)
func Leave(i, j):
	#SignalEvents.char_attack_exit.emit(self)
	#SignalEvents.emit_game_signal("char_attack_exit", self)
	Transitioned.emit(self, j)
