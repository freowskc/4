extends ProgressBar
class_name progress_bar_health_component

#func _ready() -> void:
	#show_percentage = false
	#
	#size = Vector2(16, 4)
#
	##FLAT (health bar)
	## Access the StyleBoxFlat for the Fill
	#var style_fill = StyleBoxFlat.new()
#
	## Set the color for the fill using a hex code
	#style_fill.bg_color = Color("#55a049")  # Using the hex value #55a049
#
	## Assign the style to the ProgressBar
	#add_theme_stylebox_override("fill", style_fill)
	#
	##Background
	#var style_bg = StyleBoxEmpty.new()
	#add_theme_stylebox_override("background", style_bg)
	#
	#z_index = 1
