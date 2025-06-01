extends Node

@onready var game : Node2D = $"../.."

func _on_tests_timer_timeout() -> void:
	game.set_points(100)
	var points : float = 0.0
	for spins in 50:
		points -= 10
		points += game.change_slots_test()
	print("50 Spins without cost is equals to: ", points , " points" )
