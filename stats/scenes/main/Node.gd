extends EnemyManager
func spawn_enemy():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	var spawn_position = player.global_position
	var enemy_new = basic_enemy_scene.instantiate() as Node2D
	var health_component: HealthComponent = enemy_new.get_node("HealthComponent")
	(health_component as HealthComponent).died.connect(on_died)
	var sprite = enemy_new.get_node("EnemySprite")
	sprite.frame = randi() % ENEMY_MAX_FRAMES
	add_child(enemy_new)
	sig_enemy_spawn.emit()
	enemy_new.global_position = spawn_position + Vector2(300, -100)
