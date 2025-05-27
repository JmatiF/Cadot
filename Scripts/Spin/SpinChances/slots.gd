extends Node

var icon_slots : Array = []

const CENTER = [1,4,7,10,13]
const DIAGONAL = [0,4,8,10,12]
const DIAGONAL2 = [2,4,6,10,14]

func _ready():
	icon_slots = get_tree().get_nodes_in_group("IconSlot")
