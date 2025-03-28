extends State

class_name  GengGerFall

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var move_direction : Vector2

func Enter():
	SignalEvents.emit_game_signal("gengger_wander")
	start_wander_timer()
	animation_player.play("wander")
	move_direction = Vector2(randf_range(-1,1), 0).normalized()
	
func Physics_Update(_delta: float):
	#print("velocity.x = ", owner.velocity.x , ", speed = ", owner.speed, ", move_direction = ", move_direction)
	owner.velocity = owner.speed * move_direction
	#print("velocity = ", owner.velocity, " , move_direction = ", move_direction)
	
func Leave(state, new_state_name):
	owner.velocity = Vector2.ZERO
	SignalEvents.emit_game_signal("gengger_wander_exit")
	Transitioned.emit(self, new_state_name)
	
func start_wander_timer():
	var wander_timer = Timer.new()
	add_child(wander_timer)
	wander_timer.name = "WanderTimer"
	wander_timer.timeout.connect(_on_wander_finish)
	wander_timer.wait_time = randf_range(1.0, 5.0)
	wander_timer.start()
	
func _on_wander_finish():
	Leave(self, "gengger_wander")
