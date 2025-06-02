extends Node

enum line_type {CENTER,HORIZONTAL,DIAGONAL}
@onready var game : Node2D = $"../.."

func _on_tests_timer_timeout() -> void:
	print("Winner average with 100 spins CENTRAL: ", test_winner_central())
	print("Winner average with 100 spins HORIZONTAL: ", test_winner_horizontal())
	print("Winner average with 100 spins DIAGONAL: ", test_winner_diagonal())

func test_winner_chances(new_line : line_type ,sub_points : float) -> int:
	game.change_line_type(new_line)
	game.set_points(100)
	var winner_count : int = 0
	for spins in 100:
		if sub_points < game.change_slots_test():
			winner_count += 1
	game.change_line_type(line_type.CENTER)
	return winner_count

func test_winner_central() -> int:
	return test_winner_chances(line_type.CENTER, 10)

func test_winner_horizontal() -> int:
	return test_winner_chances(line_type.HORIZONTAL, 20)

func test_winner_diagonal() -> int:
	return test_winner_chances(line_type.DIAGONAL, 30)
