extends Node

@onready var slots_panel : Node2D = $"../.."
@onready var slots : Node2D = $"../../Slots"

func control_array(line_type, id, slot_in_use):
	if should_check_chances(line_type, id, slot_in_use):
		handle_slot_chances(line_type[slot_in_use])
	elif is_slot_skipped(line_type, id, slot_in_use):
		increase_slot_in_use()


# -------------------------------------------------------------------------------


func should_check_chances(line_type, id, slot_in_use) -> bool:
	return line_type[slot_in_use] + 1 == id and not slots_panel.get_added_chances()


func is_slot_skipped(line_type, id, slot_in_use) -> bool:
	return line_type[slot_in_use] + 1 < id and not slots_panel.get_added_chances()


func handle_slot_chances(slot_card_id: int) -> void:
	if slots.get_card_id(slot_card_id) > 6:
		increase_slot_in_use()
	else:
		give_classic_chances(slots.get_card_id(slot_card_id))
		reset_slot_state()


func increase_slot_in_use() -> void:
	slots_panel.set_slot_in_use(slots_panel.get_slot_in_use() + 1)


func give_classic_chances(card_id: int) -> void:
	for i in 4:
		slots_panel.classics_chances(card_id)


func reset_slot_state() -> void:
	slots_panel.set_slot_in_use(0)
	slots_panel.set_added_chances(true)
