extends Node

var slots_array : Array

var winner_card : int = -1
var current_slot : int = 0

var points : float = 0
var current_points : float = 0

var current_line : Array

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

func control_return():
	for id in current_line:
		slots_array[id].winner_lights()
		print("points: ", points)
	current_line.clear()
	return points

func control_win_condition(winner_line : Array):
	for id in range(slots_array.size()):
		if current_slot < 5:
			if id == winner_line[current_slot]:
				if winner_card == -1:
					winner_card = control_slot_card(id)
				elif winner_card == slots_array[id].get_card_id():
					count_points(slots_array[id].get_card_id())
				current_slot += 1
	
	actualize_points(winner_line)


func actualize_points(winner_line : Array):
	if current_points > points:
		points = current_points
		print("Then, current points: ", current_points)
	print("Then, just points: ", points)
	print("Then, current line: ", current_line)
	print("Winner card: ", winner_card)
	current_points = 0
	winner_card = -1
	current_slot = 0


func control_slot_card(id : int) -> int:
	var card_id = slots_array[id].get_card_id()
	print("CARD ID IS: ", card_id)
	if card_id <= 6:
		print("IS THAT ALSO TRUE ===", count_points(card_id))
		if count_points(card_id):
			print("here maybe")
			current_line.append(id)
		return card_id
	else:
		if count_points(card_id):
			current_line.append(id)
		return -1


func count_points(card_id : int) -> bool:
	if card_id == winner_card or card_id > 6:
		print("IS THAT TRUE ?: ", card_id == winner_card)
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
