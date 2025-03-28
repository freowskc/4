extends State

class_name  GengGerIdle

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var idle_timer: Timer
func Enter():
	print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
	SignalEvents.emit_game_signal("gengger_idle_enter")
	animation_player.play("genggeridle")
	start_wander_timer()
	#SignalEvents.char_idle_enter.emit(self)
	#SignalEvents.emit_signal("char_idle_enter", self)

func Leave(i, j):
	#SignalEvents.char_idle_exit.emit(self)
	#SignalEvents.emit_game_signal("char_idle_exit", self)
	#SignalEvents.emit_signal("char_idle_enter", self)
	print("Leave idle to ", j)
	print("current state = ", i)
	print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
	Transitioned.emit(self, j)
	
func start_wander_timer():
	print("gengger idle  start wander timer")
	idle_timer = Timer.new()
	add_child(idle_timer)
	idle_timer.name = "WanderInit"
	idle_timer.timeout.connect(_on_wander_finish)
	idle_timer.wait_time = randf_range(1.0, 2.0)
	idle_timer.start()

func _on_wander_finish():
	print("gengger idle on wander finish")
	print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ idle_timer.queue_free")
	if idle_timer != null :
		idle_timer.queue_free()
	Leave(self, "genggerwander")
