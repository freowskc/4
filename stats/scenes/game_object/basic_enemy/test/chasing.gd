extends State

class_name  GengGerChasing

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var character_body_2d: Test = $"../.."

func Enter():
	character_body_2d.speed += 200
	animation_player.speed_scale *= 1.2
	#var direction = (target.position - position).normalised()
	animation_player.play("gengger_chasing")
	
	#SignalEvents.char_idle_enter.emit(self)
	#SignalEvents.emit_signal("char_idle_enter", self)

func Physics_Update(_delta: float):
	if owner.is_on_wall():
		Leave(self, "gengger_idle")
		
	
func Leave(i, j):
	#character_body_2d.speed -= 100
	#SignalEvents.char_idle_exit.emit(self)
	#SignalEvents.emit_game_signal("char_idle_exit", self)
	#SignalEvents.emit_signal("char_idle_enter", self)
	Transitioned.emit(self, j)
	




