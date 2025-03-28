extends Timer

class_name LocalTimer

func _on_timeout() -> void:
	#SignalEvents.char_timer.emit(self)
	SignalEvents.emit_signal("char_timer", self)

	wait_time = randf_range(1.0, 5.0)
	print("wait time = ", wait_time)
