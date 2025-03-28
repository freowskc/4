extends Node2D

@export var digit_spritesheet: Texture  # Assign damagenumber.png in the editor
@export var digit_width: int = 16        # Width of each digit in the spritesheet
@export var digit_height: int = 16      # Height of each digit in the spritesheet
@export var crit_bg: Texture
@export var export_crit_sfx: AudioStream
@export var export_non_crit_sfx: AudioStream

#@onready var sfx_crit: AudioStreamPlayer = $sfx_crit
#@onready var sfx_non_crit: AudioStreamPlayer = $sfx_non_crit


var position_start: Vector2
var position_control: Vector2
var position_end: Vector2

func _ready() -> void:
	
	# Typically, you would call `show_damage()` here or when damage occurs
	pass

func show_damage(damage: Array, direction):
	var is_crit = damage[1]
	# Remove existing digit sprites
	for child in get_children():
		child.queue_free()

	var damage_str = str(damage[0]).lstrip("0")
	if damage_str == "":
		damage_str = "0"

	if direction == "vertical":
		var total_height = damage_str.length() * digit_height
		var y_offset = -total_height / 2

		for i in range(damage_str.length()):
			var digit_char = damage_str[i]
			var digit = int(digit_char)
			var sprite = Sprite2D.new()
			sprite.texture = digit_spritesheet
			sprite.region_enabled = true
			sprite.region_rect = Rect2(digit * digit_width, 0, digit_width, digit_height)
			sprite.position = Vector2(0, y_offset + i * digit_height + digit_height / 2)
			add_child(sprite)
	else:
		var total_width = damage_str.length() * digit_width
		var x_offset = -total_width / 2
		if is_crit:
			self.modulate = Color(1, 1, 0)
			
			#audio
			var audio_crit = AudioStreamPlayer.new()
			audio_crit.stream = export_crit_sfx
			add_child(audio_crit)
			audio_crit.play()
			
			var sprite_crit = Sprite2D.new()
			sprite_crit.texture = crit_bg
			sprite_crit.position = Vector2(0, 0)
			sprite_crit.z_index = 3
			add_child(sprite_crit)
			print("played audio")
		else:
			var audio_non_crit = AudioStreamPlayer.new()
			audio_non_crit.stream = export_non_crit_sfx
			add_child(audio_non_crit)
			audio_non_crit.volume_db = -4
			audio_non_crit.play()

		for i in range(damage_str.length()):
			var digit_char = damage_str[i]
			var digit = int(digit_char)
			var sprite = Sprite2D.new()
			sprite.texture = digit_spritesheet
			sprite.region_enabled = true
			sprite.region_rect = Rect2(digit * digit_width, 0, digit_width, digit_height)
			sprite.position = Vector2(x_offset + i * digit_width + digit_width / 2, 0)
			sprite.z_index = 4
			add_child(sprite)

	# Start the animation after setting up the damage number
	animate_damage_number()

func animate_damage_number():
	# Set initial scale and color
	self.scale = Vector2(4.5, 4.5)

	# Store initial position
	position_start = self.position
	# Define control point and end point for the curve
	position_control = position_start + Vector2(20, -250)  # Adjust these values for curvature
	position_end = position_start + Vector2(40, -100)        # Adjust end position as needed

	# Create a Tween
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), .3)
	tween.set_parallel(true)
	# Use tween_method to update position along the curve over 1 second
	tween.tween_method(_update_position_along_curve, 0.0, 1.0, 1.0)

	# Animate alpha (fade out) over 1 second
	tween.tween_property(self, "modulate:a", 0, 1.0)

	# Animate scale (shrink to normal size) over 1 second
	#tween.tween_property(self, "scale", Vector2(1, 1), .3)

	# Schedule z_index change after 1 second
	tween.tween_callback(_change_z_index)

	# Connect the finished signal to clean up
	tween.connect("finished", queue_freedmg)

func _update_position_along_curve(t):
	# Quadratic Bezier curve calculation
	var p0 = position_start
	var p1 = position_control
	var p2 = position_end
	var pos = ((1 - t) * (1 - t)) * p0 + 2 * (1 - t) * t * p1 + (t * t) * p2
	self.position = pos

func _change_z_index():
	self.z_index = 1
	print("changed z index")

func queue_freedmg():
	queue_free()
	print("queue freed")
