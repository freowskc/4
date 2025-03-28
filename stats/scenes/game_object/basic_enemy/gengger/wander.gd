extends State

class_name  GangGerWander

@onready var character_body_2d: Test = $"../.."
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var wander_timer: Timer

var move_direction : Vector2

func Enter():
	SignalEvents.emit_game_signal("gengger_wander")
	print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
	print("entering state")
	start_wander_timer()
	animation_player.play("wander")
	move_direction = Vector2(randf_range(-1,1), 0).normalized()
	
func Physics_Update(_delta: float):
	#print("velocity.x = ", owner.velocity.x , ", speed = ", owner.speed, ", move_direction = ", move_direction)
	owner.velocity = owner.speed * move_direction
	#if character_body_2d.is_on_wall():
		#move_direction[0] *= -1
	#print("velocity = ", owner.velocity, " , move_direction = ", move_direction)
	
func Leave(state, new_state_name):
	print("gengger wander leave state to ", new_state_name)
	print("current state = ", state)
	if wander_timer != null :
		wander_timer.queue_free()
	SignalEvents.emit_game_signal("gengger_wander_exit")
	print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
	Transitioned.emit(self, new_state_name)
	
func start_wander_timer():
	print("gengger wander start wander")
	wander_timer = Timer.new()
	add_child(wander_timer)
	wander_timer.name = "GengGerWanderTimer"
	wander_timer.timeout.connect(_on_wander_finish)
	wander_timer.wait_time = randf_range(1.0, 4.0)
	wander_timer.start()
	
func _on_wander_finish():
	print("gengger wander on wander finish")
	#print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ wander_timer.queue_free")
	#wander_timer.queue_free()
	owner.velocity = Vector2.ZERO
	Leave(self, "gengger_idle")

func _on_detecing_area_area_entered(area: Area2D) -> void:
	print("gengger wander on detecting")
	if area.is_in_group("ryu_area"):
		print("gengger wander hit ryu hit ryu hit ryu hit ryu hit ryu hit ryu hit ryu hit ryu")
		#print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ wander_timer.queue_free on_detect")
		#wander_timer.queue_free()
		Leave(self, "gengger_chasing")
