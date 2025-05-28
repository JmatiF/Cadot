extends Node2D

var icon_slots : Array = []

func _ready():
	icon_slots = get_tree().get_nodes_in_group("IconSlot")

func slot_texture(id : int, texture_id : int):
	icon_slots[id].set_card_texture(texture_id)

func get_card_id(id: int) -> int:
	return icon_slots[id].get_card_id()
