extends Node

const CLASSIC_IDS = [1, 2, 3, 4, 5, 6]
const WILDCARD_IDS = [7, 8]
const BONUS_IDS = [9]

# Group probabilities
const CLASSIC_PROB = 0.65
const WILDCARD_PROB = 0.20
const BONUS_PROB = 0.15

func _ready():
	randomize()

func pick_card_group_based() -> int:
	randomize()
	var r = randf()
	if r < CLASSIC_PROB:                                   # randi() big ramdom number
		return CLASSIC_IDS[randi() % CLASSIC_IDS.size()]   # % 6 
	elif r < CLASSIC_PROB + WILDCARD_PROB:                 # result will by between 1-6
		return WILDCARD_IDS[randi() % WILDCARD_IDS.size()] # % 2
	else:                                                  # result will by between 1-2
		return BONUS_IDS[0]
