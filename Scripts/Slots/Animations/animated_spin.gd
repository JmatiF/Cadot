extends Node

@onready var slots_panel : Node2D = $"../.."
@onready var slots : Node2D = $"../../Slots"
@onready var spin_timer : Timer = $"../SpinTimer"

@onready var row_timer : Timer = $"RowTimer"
@onready var row_timer2 : Timer = $"RowTimer2"
@onready var row_timer3 : Timer = $"RowTimer3"

var row_1 : Array = [0,3,6,9,12]
var row_2 : Array = [1,4,7,10,13]
var row_3 : Array = [2,5,8,11,14]

var line

func _ready():
	randomize()

func animated_spin(new_line) -> float:
	set_row_timers()
	one_shot_row_false()
	line = new_line
	start_row_timers()
	start_spin_timer()
	await spin_timer.timeout
	one_shot_row_true()
	await row_timer3.timeout
	start_spin_last_timer()
	await spin_timer.timeout
	return slots_panel.change_slots(line)

func set_card(row):
	var id = 0
	for nodes in 5:
		slots.slot_texture(row[id], get_random_1_to_9())
		id += 1

func get_random_1_to_9() -> int:
	randomize()
	return randi_range(1, 9)

func start_spin_timer():
	spin_timer.wait_time = 1
	spin_timer.start()

func start_spin_last_timer():
	spin_timer.wait_time = 0.3
	spin_timer.start()

func start_row_timers():
	row_timer.start()
	row_timer2.start()
	row_timer3.start()

func one_shot_row_true():
	row_timer.one_shot = true
	row_timer2.one_shot = true
	row_timer3.one_shot = true

func one_shot_row_false():
	row_timer.one_shot = false
	row_timer2.one_shot = false
	row_timer3.one_shot = false

func set_row_timers():
	row_timer.wait_time = 0.3
	row_timer2.wait_time = 0.4
	row_timer3.wait_time = 0.5

func _on_row_timer_timeout() -> void:
	set_card(row_1)
	row_timer.wait_time = row_timer.wait_time + 0.1
func _on_row_timer_2_timeout() -> void:
	set_card(row_2)
	row_timer2.wait_time = row_timer2.wait_time + 0.1
func _on_row_timer_3_timeout() -> void:
	set_card(row_3)
	row_timer3.wait_time = row_timer3.wait_time + 0.1
