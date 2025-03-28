extends Marker2D


func popup(damage) -> void:
	var label = get_node("Label")  # Manually get the Label node
	print("popup get called damage =", damage, "label =", label)
	if label != null:
		label.text = str(damage)
		print("popup get called damage = label.text =", label.text)
	else:
		print("Label node not found")

	
