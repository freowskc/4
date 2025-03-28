extends State

class_name  PillowSleep

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func Enter():
	animation_player.play("sleep")
	#SignalEvents.char_idle_enter.emit(self)
	#SignalEvents.emit_signal("char_idle_enter", self)

func Leave(i, j):
	#SignalEvents.char_idle_exit.emit(self)
	#SignalEvents.emit_game_signal("char_idle_exit", self)
	#SignalEvents.emit_signal("char_idle_enter", self)
	Transitioned.emit(self, j)
	
func on_get_dmg():
	Leave(self, "wake_up")
