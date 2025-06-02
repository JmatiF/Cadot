extends Node

enum line_type {CENTER,HORIZONTAL,DIAGONAL}
@onready var game : Node2D = $"../.."

func _on_tests_timer_timeout() -> void:
	print("100 Central Spins with cost is equal to: ", test_central_line() , " points... Average", test_central_line()/100)
	print("100 Horizontal Spins with cost is equal to: ", test_horizontal_line() , " points... Average", test_horizontal_line()/100)
	print("100 Diagonal Spins with cost is equal to: ", test_diagonal_line() , " points... Average", test_diagonal_line()/100)

func test_central_line() -> float:
	game.change_line_type(line_type.CENTER)
	game.set_points(100)
	var points : float = 0.0
	for spins in 100:
		points -= 10
		points += game.change_slots_test()
	game.change_line_type(line_type.CENTER)
	return points

func test_horizontal_line() -> float:
	game.change_line_type(line_type.HORIZONTAL)
	game.set_points(100)
	var points : float = 0.0
	for spins in 100:
		points -= 20
		points += game.change_slots_test()
	game.change_line_type(line_type.CENTER)
	return points

func test_diagonal_line() -> float:
	game.change_line_type(line_type.DIAGONAL)
	game.set_points(100)
	var points : float = 0.0
	for spins in 100:
		points -= 30
		points += game.change_slots_test()
	game.change_line_type(line_type.CENTER)
	return points
