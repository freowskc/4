extends State

class_name  RogueIdle
@onready var animation = %AnimRyuComponent/AnimationPlayer

func Enter():
	animation.play("idle")
	#SignalEvents.char_idle_enter.emit(self)
	#SignalEvents.emit_signal("char_idle_enter", self)
	SignalEvents.emit_game_signal("char_idle", self)

func Leave(i, j):
	#SignalEvents.char_idle_exit.emit(self)
	#SignalEvents.emit_game_signal("char_idle_exit", self)
	#SignalEvents.emit_signal("char_idle_enter", self)
	Transitioned.emit(self, j)
