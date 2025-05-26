extends Node2D

@onready var slots_panel : Node2D = $"CanvasLayer/HBoxContainer/SlotsPanel"

func change_slots():
	slots_panel.change_slots()
