extends State

class_name  PriestAttack

@onready var animation_player: AnimationPlayer = %AnimationPlayer

@onready var attack_cooldown_timer: Timer
@onready var enemy
@onready var attack_count: int = 0

func Enter():
	print("enter priest attack")
	start_attack_cooldown_timer()

func Leave(i, j):
	Transitioned.emit(self, j)
	
func start_attack_cooldown_timer():
	if attack_cooldown_timer == null:
		attack_cooldown_timer = Timer.new()
		add_child(attack_cooldown_timer)
		attack_cooldown_timer.name = "AttackCoolDownTimer"
		attack_cooldown_timer.timeout.connect(on_attack_cooldown_finish)
		attack_cooldown_timer.wait_time = 2
		attack_cooldown_timer.start()
	
func on_attack_cooldown_finish():
	if attack_cooldown_timer != null:
		attack_cooldown_timer.queue_free()
		attack()
		await animation_player.animation_finished
		start_attack_cooldown_timer()
		animation_player.play("walking")

func on_all_enemies_die():
	if attack_cooldown_timer != null:
		attack_cooldown_timer.queue_free()
	Leave(self, "priestwalk")

func attack():
	is_enemy_exist()
	if enemy:
		print("priest attacking")
		animation_player.play("attack")
		SignalEvents.unit_attack.emit(owner.calculate_damage(), enemy)
		attack_count += 1
		print("attack count = ", attack_count, "           attacker = ", owner, "   team = ", owner.team)

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
