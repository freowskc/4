extends State

class_name RogueWander
@onready var animation = %AnimRyuComponent/AnimationPlayer
var move_direction : Vector2
@onready var rogue_wander_timer: Timer
func Enter():
	start_wander_timer()
	animation.play("run")
	move_direction = Vector2(randf_range(-1,1), 0).normalized()
	#SignalEvents.char_wander_enter.emit(self)
	#SignalEvents.emit_signal("char_wander_enter", self)
	SignalEvents.emit_game_signal("char_wander", self)

	
func Physics_Update(_delta: float):
	#print("velocity.x = ", owner.velocity.x , ", speed = ", owner.speed, ", move_direction = ", move_direction)
	owner.velocity = owner.speed * move_direction
	#print("velocity = ", owner.velocity, " , move_direction = ", move_direction)
	
	
func Leave(i, j):
	owner.velocity = Vector2.ZERO
	#SignalEvents.char_wander_exit.emit(self)
	#SignalEvents.emit_game_signal("char_wander_exit", self)
	Transitioned.emit(self, j)

func start_wander_timer():
	rogue_wander_timer = Timer.new()
	add_child(rogue_wander_timer)
	rogue_wander_timer.name = "WanderTimer"
	rogue_wander_timer.timeout.connect(_on_wander_finish)
	rogue_wander_timer.wait_time = randf_range(1.0, 5.0)
	rogue_wander_timer.start()
	
func _on_wander_finish():
	if rogue_wander_timer != null:
		rogue_wander_timer.queue_free()
	Leave(self, "rogue_idle")
