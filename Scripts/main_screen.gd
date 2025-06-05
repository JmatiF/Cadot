extends Node2D

@onready var slots_panel : Node2D = $"CanvasLayer/HBoxContainer/SlotsPanel"
@onready var current_option : Label = $CanvasLayer/CurrentOptionContainer/CurrentOption
@onready var points_label : Label = $"CanvasLayer/CurrentPointsContainer/PointsLabel"
@onready var sum_label : Label = $"CanvasLayer/SumContainer/SumLabel"
@onready var spin_points_label : Label = $"CanvasLayer/SpinPointsContainer/SpinPointsLabel"
@onready var confetti_animation : CanvasLayer = $"ConfettiAnimation"

enum line_type {CENTER,HORIZONTAL,DIAGONAL}

var current_line_type = line_type.CENTER

var points :float = 100.0
@export var confetti : bool = true

func change_slots():
	#var spin_points = slots_panel.change_slots(get_line_type())
	var spin_points = await slots_panel.spin(get_line_type())
	
	points += spin_points
	
	points_label.text = "Points: " + str(points)
	sum_label.text = "+ " + str(spin_points)
	
	if confetti:
		confetti_animation.celebrate(spin_points,subtraction_points())


func change_slots_test() -> float:
	return slots_panel.change_slots(get_line_type())



func _on_central_button_pressed() -> void:
	change_line_type(line_type.CENTER)
	current_option.text = "Current option: Central"
	spin_points_label.text = "Points to \nspin: 10"

func _on_horizontal_button_pressed() -> void:
	change_line_type(line_type.HORIZONTAL)
	current_option.text = "Current option: Horizontal"
	spin_points_label.text = "Points to \nspin: 20"

func _on_diagonal_button_pressed() -> void:
	change_line_type(line_type.DIAGONAL)
	current_option.text = "Current option: Diagonal"
	spin_points_label.text = "Points to \nspin: 30"


func change_line_type(new_type):
	current_line_type = new_type

func get_line_type() -> int:
	return current_line_type

func get_points() -> float:
	return points
func set_points(value: float) -> void:
	points = value


func _on_spin_button_pressed() -> void:
	points -= subtraction_points()
	change_slots()

func subtraction_points() -> float:
	if current_line_type == line_type.CENTER:
		return 10
	elif current_line_type == line_type.HORIZONTAL:
		return 20
	elif current_line_type == line_type.DIAGONAL:
		return 30
	return 0
