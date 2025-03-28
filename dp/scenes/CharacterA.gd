extends CharacterBody2D

var speed = 100.0
var direction = 1  # 1 for right, -1 for left
var movement_timer = 0.0
var change_direction_time = 2.0
var rng = RandomNumberGenerator.new()
var fixed_y_position = 350  # Raised the y position to make characters higher

# Stamina system
var stamina = 100.0
var max_stamina = 100.0
var stamina_drain_rate = 5.0  # Stamina points drained per second
var is_resting = false

func _ready():
	rng.randomize()
	# Set random initial direction
	direction = 1 if rng.randf() > 0.5 else -1
	# Set random change direction time
	change_direction_time = rng.randf_range(1.0, 3.0)
	# Set fixed Y position
	position.y = fixed_y_position
	# Update stamina bar
	$StaminaBar.value = stamina
	# Set collision detection
	set_collision_mask_value(2, true)  # Layer 2 for items

func _physics_process(delta):
	# Keep Y position fixed
	position.y = fixed_y_position
	
	# Update stamina
	if !is_resting:
		stamina -= stamina_drain_rate * delta
		if stamina <= 0:
			stamina = 0
			is_resting = true
	
	# Update stamina bar
	$StaminaBar.value = stamina
	
	# Move only if has stamina
	if !is_resting:
		# Move in current direction
		velocity.x = direction * speed
		velocity.y = 0  # Ensure no vertical movement
		move_and_slide()
		
		# Update timer
		movement_timer += delta
		
		# Check if it's time to change direction
		if movement_timer >= change_direction_time:
			# Reset timer
			movement_timer = 0.0
			
			# Change direction
			direction *= -1
			
			# Set new random change direction time
			change_direction_time = rng.randf_range(1.0, 3.0)
		
		# Flip sprite based on direction
		if direction < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
	else:
		# If resting, stop movement
		velocity.x = 0
		velocity.y = 0
		move_and_slide()
	
	# Check screen boundaries
	var screen_size = get_viewport_rect().size
	if position.x < 25:
		position.x = 25
		direction = 1
	elif position.x > screen_size.x - 25:
		position.x = screen_size.x - 25
		direction = -1
	
	# Check for collisions with items
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody2D:
			# This is an item - gain stamina
			add_stamina(10)
			# Remove the item
			collision.get_collider().queue_free()

# Function to add stamina with a cap at max_stamina
func add_stamina(amount):
	stamina += amount
	if stamina > max_stamina:
		stamina = max_stamina
	
	# If was resting, start moving again
	if is_resting and stamina > 0:
		is_resting = false
