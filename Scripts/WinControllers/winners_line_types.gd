extends Node

const CENTER : Array = [1,4,7,10,13]

const HORIZONTAL = {
	0: [0,3,6,9,12],
	1: [1,4,7,10,13],
	2: [2,5,8,11,14]
}

const DIAGONAL = {
	0: [0,3,6,9,12],
	1: [1,4,7,10,13],
	2: [2,5,8,11,14],
	3: [0,4,8,10,12],
	4: [2,4,6,10,14]
}

func get_line_type(line_id : int):
	if line_id == 0:
		return CENTER
	elif line_id ==1:
		return HORIZONTAL
	elif line_id ==2:
		return DIAGONAL
