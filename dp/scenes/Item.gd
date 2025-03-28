extends RigidBody2D

var floor_level = 370
var floating = false
var float_amplitude = 5.0
var float_speed = 2.0
var time = 0.0

# Called by Main.gd when creating the item
func initialize(type, click_pos):
	# Create the sprite
	var sprite = Sprite2D.new()
	sprite.texture = load("res://chractersprite/item" + type + ".png")
	add_child(sprite)
	
	# Set initial position EXACTLY where clicked
	global_position = click_pos
	
	# Set up physics properties
	gravity_scale = 5.0  # Make it fall faster
	contact_monitor = true
	max_contacts_reported = 4
	
	# Set collision layer to 2 (for items)
	set_collision_layer_value(1, false)  # Remove from default layer
	set_collision_layer_value(2, true)   # Set to layer 2 for items
	
	print("Item created at position: ", global_position)

# Connect to the body_entered signal to detect when we hit the floor
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	# When hitting any other physics body, stop falling and start floating
	floating = true
	
	# Lock position
	freeze = true
	gravity_scale = 0
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	
	# Ensure we're at the floor level
	global_position.y = floor_level
	
	print("Item hit floor, starting to float")

func _physics_process(_delta):
	# Debug physics info
	if !floating and linear_velocity.y > 0:
		print("Item falling, velocity: ", linear_velocity.y)

func _process(delta):
	if floating:
		# Float up and down
		time += delta
		global_position.y = floor_level + sin(time * float_speed) * float_amplitude
