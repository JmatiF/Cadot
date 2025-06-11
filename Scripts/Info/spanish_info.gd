extends CanvasLayer

@onready var info : Node = $"InfoComponent"

func _ready() -> void:
	display()

func display():
	info.display("Spanish")


func _on_next_button_pressed() -> void:
	info.next()


func _on_prev_button_pressed() -> void:
	pass # Replace with function body.
