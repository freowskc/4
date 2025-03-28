extends State

class_name RogueGetDamage

@onready var animation = %AnimRyuComponent/AnimationPlayer
var move_direction : Vector2
@onready var wander_timer: Timer

func Enter():
	animation.play("get_damage")
	await animation.animation_finished
	Leave(self, "rogue_idle")
	#SignalEvents.char_wander_enter.emit(self)
	#SignalEvents.emit_signal("char_wander_enter", self)
	#SignalEvents.emit_game_signal("char_wander", self)

		
func Leave(i, j):
	owner.velocity = Vector2.ZERO
	#SignalEvents.char_wander_exit.emit(self)
	#SignalEvents.emit_game_signal("char_wander_exit", self)
	Transitioned.emit(self, j)

