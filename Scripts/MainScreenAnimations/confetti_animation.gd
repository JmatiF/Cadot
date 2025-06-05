extends CanvasLayer

@onready var confetti_timer : Timer = $"ConfettiTimer"
@onready var total_confetti_timer : Timer = $"TotalConfettiTimer"
var confetti_slots : Array = []

var confetti_rotation : float = 30.0

func _ready() -> void:
	visible = false
	confetti_slots = get_tree().get_nodes_in_group("ConfettiLauncher")

func celebrate(sum_points, sub_points):
	if sum_points >= sub_points:
		animation()
	else:
		stop_animation()

func animation():
	visible = true
	confetti_timer.autostart = false
	confetti_timer.start()
	total_confetti_timer.start()

func stop_animation():
	visible = false

func _on_confetti_timer_timeout() -> void:
	for i in confetti_slots.size():
		confetti_slots[i].rotation += confetti_rotation
		confetti_rotation = -confetti_rotation
	
	confetti_rotation = -confetti_rotation


func _on_total_confetti_timer_timeout() -> void:
	confetti_timer.autostart = true
	stop_animation()
