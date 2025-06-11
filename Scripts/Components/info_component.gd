extends Node

@onready var spanish_canvas : CanvasLayer = $"SpanishCanvas"
var spanish_pages : Array = [0,1]

func _ready() -> void:
	close()

func display(lenguaje : String):
	if lenguaje == "Spanish":
		if show_or_next(spanish_canvas):
			pass
			#next()


func close():
	spanish_canvas.visible = false

func show_or_next(canvas : CanvasLayer) -> bool:
	if canvas.visible == true:
		return true
	else:
		spanish_canvas.visible = true
		return false
