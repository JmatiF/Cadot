extends Node

@onready var spanish_canvas : CanvasLayer = $"SpanishCanvas"
var spanish_pages : Array = [1,2,3]

var current_page : int = 0

var current_canvas : CanvasLayer
var current_array : Array

func _ready() -> void:
	close()

func display(lenguaje : String):
	if lenguaje == "Spanish":
		current_canvas = spanish_canvas
		current_array = spanish_pages
		show_interface()

func next():
	if not current_canvas or not current_array:
		return
	
	if current_page >= current_array.size():
		current_canvas.visible = false
		current_page = 0 
		return
	
	var page_name := "Page" + str(current_array[current_page])
	var page := current_canvas.get_node_or_null(page_name)
	
	hide_all_pages()
	page.visible = true
	current_page += 1


func close():
	spanish_canvas.visible = false

func show_interface():
	if not current_canvas.visible:
		current_canvas.visible = true
	
	next()

func hide_all_pages() -> void:
	for i in range(current_array.size()):
		var page_name := "Page" + str(current_array[i])
		var page_node := current_canvas.get_node_or_null(page_name)
		if page_node:
			page_node.visible = false
	
