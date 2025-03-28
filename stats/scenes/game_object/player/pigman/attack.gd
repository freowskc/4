extends State

class_name PigmanAttack

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $"../../AudioStreamPlayer"

var attack_cooldown_timer: Timer
var enemy
var attack_count: int = 0

func Enter():
	start_attack_cooldown_timer()

func Leave(i, j):
	Transitioned.emit(self, j)
	
func start_attack_cooldown_timer():
	if attack_cooldown_timer == null:
		attack_cooldown_timer = Timer.new()
		add_child(attack_cooldown_timer)
		attack_cooldown_timer.name = "AttackCooldownTimer"
		attack_cooldown_timer.connect("timeout", on_attack_cooldown_finish)
	# Set cooldown based on attack speed
	attack_cooldown_timer.wait_time = 1.0 / owner.attack_speed
	attack_cooldown_timer.start()
	
func on_attack_cooldown_finish():
	attack_cooldown_timer.stop()
	attack()
	# Start the cooldown timer again
	start_attack_cooldown_timer()

func on_all_enemies_die():
	if attack_cooldown_timer != null:
		attack_cooldown_timer.stop()
	Leave(self, "walk")

func attack():
	is_enemy_exist()
	if enemy:
		var cooldown_duration = 1.0 / owner.attack_speed
		var attack_animation = "attack"
		var animation_length = animation_player.get_animation(attack_animation).length
		print("ANIMATION LENGTH = ", animation_player.get_animation(attack_animation).length)
		# Ensure values are valid
		if animation_length == 0 or owner.attack_speed == 0:
			print("Warning: Invalid animation length or attack speed.")
			return

		# Calculate the playback speed to match the cooldown duration
		var playback_speed = animation_length / cooldown_duration

		# Play the attack animation with adjusted speed
		#audio_stream_player.play()
		animation_player.play(attack_animation, -1.0, playback_speed)

		SignalEvents.unit_attack.emit(owner.calculate_damage(), enemy)
		attack_count += 1
		print("attack count = ", attack_count, "  attacker = ", owner, "  team = ", owner.team)

func is_enemy_exist():
	print("owner.team in cheeck = ", owner.team)
	if owner.team == "Player":
		SignalEvents.check_if_enemy_exist.emit()
		print("attacing send emit else check if enemy exist | in priest")
	elif owner.team == "Enemy":
		SignalEvents.check_if_player_exist.emit()
		print("attacing send emit else check if player exist | in priest")
		
func on_enemy_spawn(enemy_to_be_attack):
	enemy = enemy_to_be_attack
	
func on_player_spawn(player_to_be_attack):
	enemy = player_to_be_attack
