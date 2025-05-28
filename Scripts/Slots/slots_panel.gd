extends Node2D

@onready var slots : Node2D = $"Slots"
@onready var spin_chances : Node = $"SpinChances"
@onready var line_types : Node = $"ChancesControllers/LineTypes"
@onready var slots_controllers : Node = $"ChancesControllers/SlotsControllers"

var slot_in_use : int = 0
var added_chances : bool = false
var line_type

func _ready() -> void:
	change_slots(0)
	spin_chances.classics_remove()

func change_slots(line : int):
	line_type = line_types.get_line_type(line)
	
	for id in 15:
		var card = spin_chances.pick_card_group_based()
		set_line(id)
		
		slots.slot_texture(id, card)
	spin_chances.classics_remove()
	slot_in_use = 0
	added_chances = false


func set_line(id):
	if line_type is Array:
		slots_controllers.control_array(line_type,id,slot_in_use)
	



# ------------------------------------------------------------------------------

func classics_chances(car_id : int):
	spin_chances.classics_append(car_id)


func get_slot_in_use() -> int:
	return slot_in_use
func set_slot_in_use(value: int) -> void:
	slot_in_use = value
func get_added_chances() -> bool:
	return added_chances
func set_added_chances(value: bool) -> void:
	added_chances = value
