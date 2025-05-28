extends Node

const CENTER : Array = [1,4,7,10,13]
const HORIZONTAL : int = 3
const DIAGONAL : Array = [0,4,8,10,12]
const DIAGONAL2 : Array = [2,4,6,10,14]

func get_line_type(line_id : int):
	if line_id == 0:
		return CENTER
	elif line_id ==1:
		return HORIZONTAL
	elif line_id ==2:
		return DIAGONAL
	elif line_id ==3:
		return DIAGONAL2
