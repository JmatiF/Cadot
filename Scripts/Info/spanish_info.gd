extends CanvasLayer

@onready var info : Node = $"InfoComponent"

func display():
	info.display("Spanish")
