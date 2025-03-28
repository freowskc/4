# Main.gd
extends Node2D

const BLOCK_HEIGHT = 64  # Adjust this value

var block_scene = preload("res://scenes/tetris/block.tscn")
var grid = []
var spawn_timer
var block_container

func _ready():
	randomize()
	block_container = get_node("BlockContainer")
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.wait_time = 1.0
	spawn_timer.connect("timeout", _spawn_block)
	spawn_timer.start()

func _spawn_block():
	if grid.size() >= 7:
		return

	var new_block = block_scene.instantiate()
	new_block.block_type = _get_random_block_type()
	new_block.level = 1
	new_block.update_block()
	new_block.connect("block_deleted", _on_block_deleted)
	block_container.add_child(new_block)
	grid.insert(0, new_block)

	# Position the new block above the grid
	new_block.position = Vector2(0, -BLOCK_HEIGHT)
	# Animate the block falling into place
	new_block.animate_to_position(Vector2(0, 0))

	# Move existing blocks down
	_update_block_positions(true)
	_check_for_merge()

func _get_random_block_type():
	var types = ['a', 'b', 'c', 'd']
	return types[randi() % types.size()]

func _update_block_positions(animated=false):
	for i in range(grid.size()):
		var block = grid[i]
		var target_y = i * BLOCK_HEIGHT
		if animated:
			block.animate_to_position(Vector2(0, target_y))
		else:
			block.position = Vector2(0, target_y)

func _check_for_merge():
	var i = 0
	while i < grid.size() - 1:
		var current_block = grid[i]
		var below_block = grid[i + 1]
		if current_block.block_type == below_block.block_type and current_block.level == below_block.level:
			_merge_blocks(below_block, current_block)
			i = 0  # Restart to check for new merges
		else:
			i += 1

func _merge_blocks(block_a, block_b):
	block_b.level += 1
	block_b.update_block()
	var index = grid.find(block_a)
	if index != -1:
		grid.remove_at(index)
		block_a.queue_free()
	_update_block_positions(true)
	_spawn_block()

func _on_block_deleted(block):
	var index = grid.find(block)
	if index != -1:
		grid.remove_at(index)
		block.queue_free()
	_update_block_positions(true)
	_check_for_merge()
	_spawn_block()
