extends Node2D

var character_a_scene = preload("res://scenes/CharacterA.tscn")
var character_b_scene = preload("res://scenes/CharacterB.tscn")
var floor_sprite_path = "res://chractersprite/Sprite-0006.png"
var item_a_texture_path = "res://chractersprite/itema.png"
var item_b_texture_path = "res://chractersprite/itemb.png"
var rng = RandomNumberGenerator.new()
var screen_width = 0
var screen_height = 0
var characters = []
var fixed_y_position = 370  # Updated to match floor level (slightly above the floor sprites)

func _ready():
	# Get screen dimensions
	screen_width = get_viewport_rect().size.x
	screen_height = get_viewport_rect().size.y
	
	# Connect button signals
	$UI/Control/HBoxContainer/AddCharacterA.pressed.connect(_on_add_character_a_pressed)
	$UI/Control/HBoxContainer/AddCharacterB.pressed.connect(_on_add_character_b_pressed)
	$UI/Control/HBoxContainer/DeleteCharacter.pressed.connect(_on_delete_character_pressed)
	
	# Seed the random number generator
	rng.randomize()
	
	# Create floor sprites and collider
	create_floor()
	
	# Create Items node if it doesn't exist
	if !has_node("Items"):
		var items_node = Node2D.new()
		items_node.name = "Items"
		add_child(items_node)

func create_floor():
	# Create Floor node if it doesn't exist
	if !has_node("Floor"):
		var floor_node = Node2D.new()
		floor_node.name = "Floor"
		add_child(floor_node)
	
	# Load floor sprite texture
	var floor_texture = load(floor_sprite_path)
	if floor_texture:
		# Create floor sprites
		for i in range(6):
			var sprite = Sprite2D.new()
			sprite.texture = floor_texture
			sprite.position = Vector2(100 + i * 200, 400)
			$Floor.add_child(sprite)
	
	# Create a floor collider for physics objects to land on
	var static_body = StaticBody2D.new()
	static_body.name = "FloorCollider"
	add_child(static_body)
	
	var collision_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(1200, 10)  # Wide enough for the whole floor, thin height
	collision_shape.shape = shape
	collision_shape.position = Vector2(600, 390)  # Position it at the floor level
	static_body.add_child(collision_shape)

func _input(event):
	# Check for ANY mouse click to spawn items (both left and right clicks)
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT:
			spawn_item(event.position)

func spawn_item(pos):
	# Load the Item scene or script
	var item_script = load("res://scenes/Item.gd")
	
	# Create a RigidBody2D for the item (required for physics)
	var item = RigidBody2D.new()
	item.set_script(item_script)
	
	# Make sure Items node exists
	if !has_node("Items"):
		var items_node = Node2D.new()
		items_node.name = "Items"
		add_child(items_node)
	
	# Add the item to the scene
	$Items.add_child(item)
	
	# Choose random item type
	var item_type = "a" if rng.randf() < 0.5 else "b"
	
	# Create collision shape for the item (needed for physics)
	var collision = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = 20  # Approximate size of item
	collision.shape = shape
	item.add_child(collision)
	
	# Initialize the item with its type and position
	item.initialize(item_type, pos)
	
func _on_add_character_a_pressed():
	add_character(character_a_scene)

func _on_add_character_b_pressed():
	add_character(character_b_scene)

func add_character(character_scene):
	var character = character_scene.instantiate()
	$Characters.add_child(character)
	
	# Set random position within screen bounds (only X varies)
	character.position.x = rng.randf_range(50, screen_width - 50)
	character.position.y = fixed_y_position
	
	# Add to our characters array for tracking
	characters.append(character)

func _on_delete_character_pressed():
	if characters.size() > 0:
		# Select a random character to delete
		var index = rng.randi_range(0, characters.size() - 1)
		var character = characters[index]
		
		# Remove from array and free
		characters.remove_at(index)
		character.queue_free()
