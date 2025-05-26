extends Node2D

@onready var slots : Node2D = $"Slots"
@onready var spin_chances : Node = $"SpinChances"

func _ready() -> void:
	change_slots()

func change_slots():
	for id in 15:
		var card = spin_chances.pick_card_group_based()
		
		slots.slot_texture(id, card)
