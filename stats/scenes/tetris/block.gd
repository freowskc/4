# Block.gd
extends TextureButton

signal block_deleted(block)

const TETROMINO_1 = preload("res://scenes/tetris/tetromino1.png")
const TETROMINO_2 = preload("res://scenes/tetris/tetromino2.png")
const TETROMINO_3 = preload("res://scenes/tetris/tetromino3.png")
const TETROMINO_4 = preload("res://scenes/tetris/tetromino3.png")  # Corrected path if needed

var block_type = ''
var level = 1
var tween: Tween = null  # Variable to store the tween

func _ready():
	connect("gui_input", _on_gui_input)
	update_block()

func update_block():
	# Set texture based on block_type
	if block_type == "a":
		texture_normal = TETROMINO_1
	elif block_type == "b":
		texture_normal = TETROMINO_2
	elif block_type == "c":
		texture_normal = TETROMINO_3
	elif block_type == "d":
		texture_normal = TETROMINO_4
	# Update tooltip text
	tooltip_text = "Type: %s\nLevel: %d" % [block_type, level]

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			emit_signal("block_deleted", self)
			queue_free()

func animate_to_position(target_position):
	if tween != null and tween.is_valid():
		tween.kill()  # Stop any existing tween
	tween = create_tween()
	tween.tween_property(self, "position", target_position, 0.5)
