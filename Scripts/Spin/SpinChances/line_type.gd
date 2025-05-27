extends Node

@onready var spin_chances : Node = $".."
@onready var slots : Node = $"../Slots"

var count : int = 0

func type_prob(line : int):
	if line == 0:
		set_count(1)

func set_count(id : int):
	if count == 0:
		sum_prob(id)
	else:
		sub_prob(id)

func sum_prob(id : int):
	count = 4
	

func sub_prob(id : int):
	pass
