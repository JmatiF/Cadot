extends Node2D

@onready var slots_panel : Node2D = $"CanvasLayer/HBoxContainer/SlotsPanel"

enum line_type {CENTER,HORIZONTAL,DIAGONAL,DIAGONAL2}

var current_line_type = line_type.CENTER

func change_slots():
	slots_panel.change_slots(get_line_type())




func _on_central_button_pressed() -> void:
	change_line_type(line_type.CENTER)

func _on_horizontal_button_pressed() -> void:
	change_line_type(line_type.HORIZONTAL)

func _on_diagonal_button_pressed() -> void:
	change_line_type(line_type.DIAGONAL)

func _on_diagonal_button_2_pressed() -> void:
	change_line_type(line_type.DIAGONAL2)

func change_line_type(new_type):
	current_line_type = new_type

func get_line_type() -> int:
	return current_line_type
