extends Node

var slots_array : Array

var winner_card : int = -1
var current_slot : int = 0

var points : float = 0
var current_points : float = 0

var current_line : Array
var new_current_line : Array = []


func control_array(winner_line : Array, current_slots_array : Array) -> float:
	slots_array = current_slots_array
	control_win_condition(winner_line)
	return control_return()

func control_dictionary(winner_dict : Dictionary, current_slots_array : Array) -> float:
	slots_array = current_slots_array
	
	for id in winner_dict:
		var winner_line = winner_dict[id]
		control_win_condition(winner_line) 
	
	return control_return()

func control_return() -> float:
	var return_points = points
	points = 0

	for id in new_current_line:
		slots_array[id].winner_lights()

	new_current_line.clear()
	return return_points


func control_win_condition(winner_line : Array):
	current_points = 0
	winner_card = -1
	current_slot = 0

	for id in range(slots_array.size()):
		if current_slot < winner_line.size() and id == winner_line[current_slot]:
			var card_id = slots_array[id].get_card_id()

			# Step 1 Establish winner card
			if winner_card == -1:
				if card_id <= 6:
					winner_card = card_id
					if count_points(card_id):
						current_line.append(id)
						current_slot += 1
				else:
					if count_points(card_id):
						current_line.append(id)
						current_slot += 1
					continue
				continue


			# Step 2 Count points
			if card_id == winner_card or card_id > 6:
				if count_points(card_id):
					current_line.append(id)
					current_slot += 1
	
	actualize_points(winner_line)



func actualize_points(winner_line : Array):
	if current_points > points:
		points = current_points
		new_current_line = current_line.duplicate()
	current_points = 0
	winner_card = -1
	current_slot = 0
	current_line.clear()


func count_points(card_id : int) -> bool:
	if card_id == winner_card or card_id > 6:
		match card_id:
			1, 2, 3, 4, 5, 6:
				current_points += 1
			7, 8:
				current_points += 4
			9:
				current_points += 5
				current_points *= 2
		return true
	return false
