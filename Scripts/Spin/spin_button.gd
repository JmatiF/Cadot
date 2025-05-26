extends Button

func _on_pressed() -> void:
	var main_screen = get_tree().get_nodes_in_group("MainScreen")[0]
	main_screen.change_slots()
