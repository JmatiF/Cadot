extends Button


func _on_pressed() -> void:
	change_scene_to("res://Scenes/Info/SpanishInfo.tscn")


func change_scene_to(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
