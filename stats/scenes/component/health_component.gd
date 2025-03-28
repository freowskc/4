extends Node
class_name HealthComponent
signal died

@export var max_health: float = 10
var current_health

@onready var health_bar: ProgressBar = $progress_bar_health_component
@onready var timer: Timer = $progress_bar_health_component/progress_bar_timer_component
@onready var dmg_bar: ProgressBar = $progress_bar_health_component/progress_bar_dmg_component

func _ready():
	if health_bar == null:
		print("Health bar not found!")
	if dmg_bar == null:
		print("Damage bar not found!")
	if timer == null:
		print("Timer not found!")

	# Initialize bars if they are valid
	if health_bar and dmg_bar:
		health_bar.max_value = max_health
		dmg_bar.max_value = max_health
		health_bar.value = max_health
		dmg_bar.value = max_health
		current_health = max_health

func damage(damage_amount: float):
	if health_bar and dmg_bar:
		current_health = max(current_health - damage_amount, 0)
		health_bar.value = current_health
		timer.start()  # Start the timer
		
		if current_health == 0:
			died.emit()
			owner.queue_free()  # Free the node when health reaches zero




func _on_progress_bar_timer_component_timeout() -> void:
	if dmg_bar:
		dmg_bar.value = current_health
