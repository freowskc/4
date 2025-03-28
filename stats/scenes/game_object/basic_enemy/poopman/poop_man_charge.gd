extends State

class_name  PoopManCharge

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite_2d: Sprite2D = $"../../Sprite2D"


func Enter():
	animation_player.play("charge")
	print("play charge")
	await animation_player.animation_finished
	Leave(self, "attack")
	#SignalEvents.char_idle_enter.emit(self)
	#SignalEvents.emit_signal("char_idle_enter", self)

func Leave(i, j):
	#SignalEvents.char_idle_exit.emit(self)
	#SignalEvents.emit_game_signal("char_idle_exit", self)
	#SignalEvents.emit_signal("char_idle_enter", self)
	sprite_2d.visible = true
	Transitioned.emit(self, j)
	
