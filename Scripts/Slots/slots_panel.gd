extends Node2D

@onready var slots : Node2D = $"Slots"
@onready var spin_chances : Node = $"SpinChances"

func _ready() -> void:
	change_slots(0)

func change_slots(line : int):
	for id in 15:
		var card = spin_chances.pick_card_group_based(line)
		
		slots.slot_texture(id, card)
