extends Node

@onready var line_type : Node = $"LineType"


var classic_ids = [1, 2, 3, 4, 5, 6]
var wildcard_ids = [7, 8]
var bonus_ids = [9]

# Group probabilities
var classic_prob = 0.80
var wildcard_prob = 0.15
var bonus_prob = 0.05

func _ready():
	randomize()

func pick_card_group_based() -> int:
	randomize()
	var r = randf()
	if r < classic_prob:                                   # randi() big ramdom number
		return classic_ids[randi() % classic_ids.size()]   # % 6 
	elif r < classic_prob + wildcard_prob:                 # result will by between 1-6
		return wildcard_ids[randi() % wildcard_ids.size()] # % 2
	else:                                                  # result will by between 1-2
		return bonus_ids[0]

func classics_append(car_id : int):
	classic_ids.append(car_id)

func classics_pop():
	classic_ids.pop_back()

func classics_remove():
	var size = classic_ids.size() -6
	for i in size:
		classics_pop()
