extends Control


func show_damage(damage_value):
	var digits_container = $DigitsContainer
	# Remove existing digit nodes
	digits_container.clear()
	
	# Convert damage to string and remove leading zeros
	var damage_str = str(int(damage_value)).lstrip("0")
	if damage_str == "":
		damage_str = "0"
	# Preload the SpriteFrames resource containing digit frames 0-9
	var digit_frames = preload("res://NumberFrames.tres") as SpriteFrames
	var animation_name = "default"  # The name of the animation in your SpriteFrames
	
	# Create a TextureRect for each digit and add it to the container
	for digit_char in damage_str:
		var digit = int(digit_char)
		var digit_texture = digit_frames.get_frame(animation_name, digit)
		var digit_texture_rect = TextureRect.new()
		digit_texture_rect.texture = digit_texture
		digits_container.add_child(digit_texture_rect)
