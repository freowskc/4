extends ProgressBar
class_name progress_bar_dmg_component

#func _ready() -> void:
	#show_percentage = false
	#
	#
	#set_anchors_preset(Control.PRESET_FULL_RECT)
	#
	##FLAT (health bar)
	## Access the StyleBoxFlat for the Fill
	#var style_fill = StyleBoxFlat.new()
	## Set the color for the fill using a hex code
	#style_fill.bg_color = Color("#bfce72")  # Using the hex value
	## Assign the style to the ProgressBar
	#add_theme_stylebox_override("fill", style_fill)
	#
	##Background
	#var style_bg = StyleBoxFlat.new()
	#style_bg.bg_color = Color("#505050")
	#add_theme_stylebox_override("background", style_bg)
	#
	#z_index = -1
